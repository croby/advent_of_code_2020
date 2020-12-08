#! /usr/bin/env ruby

input = File.open("input.txt")

passports = [""]
input.readlines.each do |line|
	if !line.chomp.empty?
		passports[passports.length-1] += line
	else
		passports.append("")
	end
end

pp_objects = []

passports.each do |passport|
	new_pp = {}
	elts = passport.split(/[\s]/)
	elts.each do |elt|
		new_pp[elt.split(":")[0]] = elt.split(":")[1]
	end
	pp_objects.append(new_pp)
end

def has_valid_keys(passport)
	required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
	
	required_keys = passport.keys
	required_keys.delete("cid")

	return required_keys.sort == required_fields.sort
end



def has_valid_values(passport)
	# 1920-2002
	def validate_birth_year(year)
		year.to_i.between?(1920, 2002)
	end

	# 2010-2020
	def validate_issue_year(year)
		year.to_i.between?(2010, 2020)
	end

	# 2020-2030
	def validate_expiration_year(year)
		year.to_i.between?(2020, 2030)
	end

	def validate_height(height)
		# valid format, number followed by cm/in
		if !height.match?(/\d+(cm|in)/)
			return false
		end

		# valid cm
		if height.include?("cm") and !height.split("cm")[0].to_i.between?(150, 193)
			return false
		end

		# valid in
		if height.include?("in") and !height.split("in")[0].to_i.between?(59, 76)
			return false
		end
		true
	end

	# hex color value
	def validate_hair_color(color)
		color.match?(/#[a-f0-9]{6}/)
	end

	# one of a few valid colors
	def validate_eye_color(color)
		["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(color)
	end

	def validate_passport_id(pid)
		pid.match?(/^[0-9]{9}$/)
	end


	# I dumped all this here because I couldn't sort out the right scoping rules
	# ehhhhh
	validators = {
		"byr" => method(:validate_birth_year),
		"iyr" => method(:validate_issue_year),
		"eyr" => method(:validate_expiration_year),
		"hgt" => method(:validate_height),
		"hcl" => method(:validate_hair_color),
		"ecl" => method(:validate_eye_color),
		"pid" => method(:validate_passport_id)
	}

	passport.each do |key, value|
		if key == 'cid'
			next
		end
		if !validators[key].call(value)
			return false
		end
	end
	true
end

valid_passports = 0

pp_objects.each do |pp|
	if has_valid_keys(pp) and has_valid_values(pp)
		valid_passports += 1
	end
end

puts valid_passports

# 102 is too high
