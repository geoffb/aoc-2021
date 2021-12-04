-- https://adventofcode.com/2021/day/3

function get_common_bit(set, position, most, fallback)
	local count = 0
	for i, bits in ipairs(set) do
		local value = tonumber(string.sub(bits, position, position))
		if value == 1 then
			count = count + 1
		end
	end
	local half = #set / 2
	if count > half then
		if most then return 1 else return 0 end
	elseif count < half then
		if most then return 0 else return 1 end
	else
		return fallback
	end
end

-- Filter a sets of bits for a given value in a given position
function filter_set_by_position(set, position, value)
	local out = {}
	for i, bits in ipairs(set) do
		local bit = tonumber(string.sub(bits, position, position))
		if bit == value then
			table.insert(out, bits)
		end
	end
	return out
end

function filter_set(set, most, fallback)
	local len = #set[1]
	for position = 1, len, 1 do
		local filter = get_common_bit(set, position, most, fallback)
		set = filter_set_by_position(set, position, filter)
		if #set == 1 then
			return tonumber(set[1], 2)
		end
	end
end

local input = io.lines(arg[1])

local bit0 = {}
local bit1 = {}

local master_set = {}

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

	table.insert(master_set, line)
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

local o2 = filter_set(master_set, true, 1)
local co2 = filter_set(master_set, false, 0)
local life_support = o2 * co2

print("Day 3, Part 1: " .. power_consumption)
print("Day 3, Part 2: " .. life_support)
