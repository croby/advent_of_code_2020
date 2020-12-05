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

required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

valid_passports = 0

pp_objects.each do |pp|
	required_keys = pp.keys
	required_keys.delete("cid")
	if required_keys.sort == required_fields.sort
		valid_passports += 1
	end
end

puts valid_passports
