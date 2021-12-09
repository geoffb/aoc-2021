-- https://adventofcode.com/2021/day/6

local input = io.lines(arg[1])

function update(fish)
	local spawns = table.remove(fish, 1)
	fish[7] = fish[7] + spawns
	table.insert(fish, spawns)
end

local fish1 = { 0, 0, 0, 0, 0, 0, 0, 0, 0 }
local fish2 = { 0, 0, 0, 0, 0, 0, 0, 0, 0 }

for line in input do
	for value in string.gmatch(line, "([^,]+)") do
		local timer_index = tonumber(value) + 1
		fish1[timer_index] = fish1[timer_index] + 1
		fish2[timer_index] = fish1[timer_index]
	end
end

for day = 1, 80, 1 do
	update(fish1)
end

local count1 = 0
for _, fish_count in ipairs(fish1) do
	count1 = count1 + fish_count
end

for day = 1, 256, 1 do
	update(fish2)
end

local count2 = 0
for _, fish_count in ipairs(fish2) do
	count2 = count2 + fish_count
end

print("Day 6, Part 1: " .. count1)
print("Day 6, Part 2: " .. count2)

