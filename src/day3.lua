-- https://adventofcode.com/2021/day/3

local input = io.lines(arg[1])

local power_consumption = 0

local on = {}

local off = {}

for line in input do
	print(line[1])

	print(line:sub(1, 1))

	print(line)
end

print("Day 3: " .. power_consumption)
