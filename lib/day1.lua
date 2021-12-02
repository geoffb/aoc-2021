-- https://adventofcode.com/2021/day/1

local input = io.lines(arg[1])

local depth_increases = 0

local prev_depth = nil

for line in input do
	local depth = tonumber(line)

	if prev_depth ~= nil and depth > prev_depth then
		depth_increases = depth_increases + 1
	end

	prev_depth = depth
end

print("Day 1: " .. depth_increases)
