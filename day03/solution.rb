#! /usr/bin/env ruby

input = File.open("input.txt")
lines = input.readlines.map(&:chomp)

line_len = lines[0].length

trees = 0
x = 1

lines[1...].each do |line|
	x = x+3
	idx = x%line_len
	if line[idx-1] == "#"
		trees +=1
	end
end

puts trees
