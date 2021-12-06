-- https://adventofcode.com/2021/day/6

local input = io.lines(arg[1])

function update(fish)
	local spawns = 0
	for i, spawn_timer in ipairs(fish) do
		if spawn_timer == 0 then
			spawns = spawns + 1
			fish[i] = 6
		else
			fish[i] = fish[i] - 1
		end
	end
	for s = 1, spawns, 1 do
		table.insert(fish, 8)
	end
end

local days = 80

local fish = {}

for line in input do
	for value in string.gmatch(line, "([^,]+)") do
		table.insert(fish, tonumber(value))
	end
end

for day = 1, days, 1 do
	update(fish)
end

print("Day 6, Part 1: " .. #fish)
