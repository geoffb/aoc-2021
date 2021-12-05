-- https://adventofcode.com/2021/day/5

function get_step(a, b)
	if a > b then
		return 1
	elseif a < b then
		return -1
	else
		return 0
	end
end

local input = io.lines(arg[1])

local plot1 = {}

local plot2 = {}

local plot_width = 0

local segments = {}

function plot_point(plot, x, y)
	local index = (y * plot_width) + x
	if plot[index] == nil then
		plot[index] = 1
	else
		plot[index] = plot[index] + 1
	end
end

-- Parse line segments from input
for line in input do
	local data = {}
	for value in string.gmatch(line, "([0-9]+)") do
		table.insert(data, tonumber(value))
	end

	local segment = {
		x1 = data[1],
		y1 = data[2],
		x2 = data[3],
		y2 = data[4]
	}

	table.insert(segments, segment)
	plot_width = math.max(plot_width, segment.x1, segment.x2)
end

-- Plot segments
for _, seg in ipairs(segments) do
	local orthogonal = seg.x1 == seg.x2 or seg.y1 == seg.y2

	local rise = get_step(seg.y2, seg.y1)
	local run = get_step(seg.x2, seg.x1)

	local x = seg.x1
	local y = seg.y1
	if orthogonal then
		plot_point(plot1, x, y)
	end
	plot_point(plot2, x, y)

	while x ~= seg.x2 or y ~= seg.y2 do
		x = x + run
		y = y + rise
		if orthogonal then
			plot_point(plot1, x, y)
		end
		plot_point(plot2, x, y)
	end
end

-- Count overlapping points
local count1 = 0
for _, value in pairs(plot1) do
	if value > 1 then
		count1 = count1 + 1
	end
end

-- Count overlapping points
local count2 = 0
for _, value in pairs(plot2) do
	if value > 1 then
		count2 = count2 + 1
	end
end

print("Day 5, Part 1: " .. count1)
print("Day 5, Part 2: " .. count2)
