-- https://adventofcode.com/2021/day/5

function get_step(a, b)
	if a >= b then
		return 1
	else
		return -1
	end
end

local input = io.lines(arg[1])

local plot = {}

local plot_width = 0

local segments = {}

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

	if segment.x1 == segment.x2 or segment.y1 == segment.y2 then
		table.insert(segments, segment)
		plot_width = math.max(plot_width, segment.x1, segment.x2)
	end
end

-- Plot segments
for _, seg in ipairs(segments) do
	for y = seg.y1, seg.y2, get_step(seg.y2, seg.y1) do
		for x = seg.x1, seg.x2, get_step(seg.x2, seg.x1) do
			local index = (y * plot_width) + x
			if plot[index] == nil then
				plot[index] = 1
			else
				plot[index] = plot[index] + 1
			end
		end
	end
end

-- Count overlapping points
local count = 0
for _, value in pairs(plot) do
	if value > 1 then
		count = count + 1
	end
end

print("Day 5, Part 1: " .. count)
