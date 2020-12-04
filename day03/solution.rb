#! /usr/bin/env ruby

input = File.open("input.txt")
lines = input.readlines.map(&:chomp)

line_len = lines[0].length
total_lines = lines.length

trees = 0

slopes = [
	{path: [1, 1], trees: 0},
	{path: [3, 1], trees: 0},
	{path: [5, 1], trees: 0},
	{path: [7, 1], trees: 0},
	{path: [1, 2], trees: 0}
]

slopes.each do |slope|
	x = 1
	y = 1
	while y + slope[:path][1] <= total_lines - 1
		x += slope[:path][0]
		idx = (x-1)%line_len

		y += slope[:path][1]
		line = lines[y-1]

		puts "line #{y}, row index #{idx}, #{line[idx] == "#"}"
		if line[idx] == "#"
			trees +=1
		end
	end
	slope[:trees] = trees
end

puts slopes
puts slopes.inject(1) {|product, s| product * s[:trees]}
