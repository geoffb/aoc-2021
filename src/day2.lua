-- https://adventofcode.com/2021/day/2

local string = require("lib/string")

local input = io.lines(arg[1])

local position1 = {
	x = 0,
	y = 0
}

local position2 = {
	x = 0,
	y = 0,
	aim = 0
}

for line in input do
	local command = string.split_words(line)
	local dir = command[1]
	local value = tonumber(command[2])
	if dir == "forward" then
		position1.x = position1.x + value
		position2.x = position2.x + value
		position2.y = position2.y + (position2.aim * value)
	elseif dir == "down" then
		position1.y = position1.y + value
		position2.aim = position2.aim + value
	elseif dir == "up" then
		position1.y = position1.y - value
		position2.aim = position2.aim - value
	else
		print("Invalid direction: " .. dir)
	end
end

print("Day 2, Part 1: " .. (position1.x * position1.y))
print("Day 2, Part 2: " .. (position2.x * position2.y))
