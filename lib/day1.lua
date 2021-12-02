-- https://adventofcode.com/2021/day/1

local input = io.lines(arg[1])

local depth_increases = 0

local prev_depth = nil

local window_size = 3

local window = {}

local window_sum = 0

local prev_window_sum = nil

local window_depth_increases = 0

for line in input do
	local depth = tonumber(line)

	if prev_depth ~= nil and depth > prev_depth then
		depth_increases = depth_increases + 1
	end

	prev_depth = depth

	table.insert(window, depth)

	window_sum = window_sum + depth

	if #window > window_size then
		window_sum = window_sum - window[1]
		table.remove(window, 1)
	end

	if prev_window_sum ~= nil and window_sum > prev_window_sum then
		window_depth_increases = window_depth_increases + 1
	end

	if #window == window_size then
		prev_window_sum = window_sum
	end
end

print("Day 1, Part 1: " .. depth_increases)
print("Day 1, Part 2: " .. window_depth_increases)
