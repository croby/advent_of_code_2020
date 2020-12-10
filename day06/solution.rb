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
	responses = {}
	g.each do |person|
		person.split('').each do |answer|
			if !responses[answer]
				responses[answer] = 1
			else 
				responses[answer] += 1
			end
		end
	end
	responses.each do |question, num_yeses|
		if num_yeses == g.length
			sum += 1
		end
	end
end
puts sum
