#! /usr/bin/env ruby

def parse_data(data, control_lower, control_upper, lower_range, upper_range)
	iterated = ""
	data.each_char do |r|
		iterated += r
		if iterated == data
			if r == control_lower
				return lower_range
			else
				return upper_range
			end
		else 
			if r == control_lower
				upper_range = (upper_range - ((upper_range - lower_range) / 2.0)).round(half: :down)
			elsif r == control_upper
				lower_range = (lower_range + ((upper_range - lower_range) / 2.0)).round(half: :up)
			end
		end
	end

end

input = File.open("input.txt")

arr = []

input.readlines.each do |line|
	arr.push({input: line.chomp})
end

arr.each do |pass|
	row_input = pass[:input][0...7]
	column_input = pass[:input][7...10]

	pass[:row] = parse_data(row_input, "F", "B", 0, 127)
	pass[:column] = parse_data(column_input, "L", "R", 0, 7)
	pass[:id] = pass[:row] * 8 + pass[:column]

end

puts arr.sort_by {|a| -a[:id]}[0][:id]