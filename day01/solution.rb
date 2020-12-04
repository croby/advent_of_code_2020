#! /usr/bin/env ruby

input = File.open("input.txt")
lines = input.readlines.map {|l| l.to_i}

def twentytwenty(*args)
	args.inject(:+) == 2020
end

lines.each do |line|
	lines.each do |second_line|
		lines.each do |third_line|
			if twentytwenty(line, second_line, third_line)
				puts line * second_line * third_line
				exit
			end
		end
	end
end
