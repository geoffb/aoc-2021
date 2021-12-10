-- https://adventofcode.com/2021/day/9

local offsets = {
	{ 0, -1 },
	{ 1, 0 },
	{ 0, 1 },
	{ -1, 0 }
}

function is_valid(grid, x, y)
	return x >= 1 and y >= 1 and x <= #grid[1] and y <= #grid
end

function is_lowest(grid, x, y)
	local target = grid[y][x]
	for _, offset in ipairs(offsets) do
		local nx = x + offset[1]
		local ny = y + offset[2]
		if is_valid(grid, nx, ny) and grid[ny][nx] <= target then
			return false
		end
	end
	return true
end

local input = io.lines(arg[1])

local grid = {}

for line in input do
	local row = {}
	for i = 1, #line, 1 do
		local value = tonumber(string.sub(line, i, i))
		table.insert(row, value)
	end
	table.insert(grid, row)
end

local total_risk = 0
for y = 1, #grid, 1 do
	local row = grid[y]
	for x = 1, #row, 1 do
		if is_lowest(grid, x, y) then
			local risk = 1 + grid[y][x]
			total_risk = total_risk + risk
		end
	end
end

print("Day 9, Part 1: " .. total_risk)
