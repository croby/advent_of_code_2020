#! /usr/bin/env ruby

input = File.open("input.txt")
lines = input.readlines.map(&:chomp)

def score_line(pw, policy_char, *idx)
	score = 0
	idx.each do |i|
		score += pw[i-1] == policy_char ? 1 : 0
	end
	score == 1
end

valid = 0

lines.each do |line|
	policy, pw = line.split(": ")
	first_idx = policy.split("-")[0].to_i
	second_idx = policy.split("-")[1].split(" ")[0].to_i
	policy_char = policy.split(" ")[1]

	if score_line(pw, policy_char, first_idx, second_idx)
		valid += 1
	end
end

puts valid