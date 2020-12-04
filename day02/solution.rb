#! /usr/bin/env ruby

input = File.open("input.txt")
lines = input.readlines.map(&:chomp)

valid = 0

lines.each do |line|
	policy, pw = line.split(": ")
	lower_bound = policy.split("-")[0].to_i
	upper_bound = policy.split("-")[1].split(" ")[0].to_i
	policy_char = policy.split(" ")[1]

	if pw.count(policy_char).between?(lower_bound, upper_bound)
		valid += 1
	end
end