#! /usr/bin/env ruby
input = File.open("input.txt")

groups = [Array.new]
input.readlines.each do |line|
	if !line.chomp.empty?
		groups[groups.length-1].append(line.chomp)
	else
		groups.append(Array.new)
	end
end

sum = 0
groups.each do |g|
	sum += g.join.split('').uniq.length
end
puts sum
