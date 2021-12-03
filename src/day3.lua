-- https://adventofcode.com/2021/day/3

local input = io.lines(arg[1])

local bit0 = {}
local bit1 = {}

for line in input do
	if #bit0 == 0 then
		for i = 1, #line, 1 do
			table.insert(bit0, 0)
			table.insert(bit1, 0)
		end
	end

	for i = 1, #line, 1 do
		local value = tonumber(string.sub(line, i, i))
		if value == 1 then
			bit1[i] = bit1[i] + 1
		else
			bit0[i] = bit0[i] + 1
		end
	end
end

local gamma_bits = {}
local epsilon_bits = {}

for i = 1, #bit0, 1 do
	if bit1[i] > bit0[i] then
		gamma_bits[i] = 1
		epsilon_bits[i] = 0
	else
		gamma_bits[i] = 0
		epsilon_bits[i] = 1
	end
end

local gamma_rate = tonumber(table.concat(gamma_bits, ""), 2)
local epsilon_rate = tonumber(table.concat(epsilon_bits, ""), 2)
local power_consumption = gamma_rate * epsilon_rate

print("Day 3, Part 1: " .. power_consumption)
