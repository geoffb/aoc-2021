-- https://adventofcode.com/2021/day/4

local fs = require("lib/fs")

-- Size of the boards, in cells
local board_size = 5

-- Parse board data from input lines starting at a given line position
function parse_board(lines, position)
	local board = {
		values = {},
		marks = {},
		score = nil
	}
	for y = position, position + board_size - 1, 1 do
		for x = 1, board_size * 3, 3 do
			local value = string.sub(lines[y], x, x + 1)
			table.insert(board.values, tonumber(value))
			table.insert(board.marks, 0)
		end
	end
	return board
end

-- Mark a board if a given ball's value is found
function mark_board(board, ball)
	for i, value in ipairs(board.values) do
		if value == ball then
			board.marks[i] = 1
			break
		end
	end
end

-- Check a set of marks for a winning position
function check_marks(marks, stride, run)
	for i = 1, board_size, 1 do
		local start = 1 + ((i - 1) * stride)
		for j = 1, board_size, 1 do
			local index = start + ((j - 1) * run)
			if marks[index] == 0 then
				break
			end
			if j == board_size then
				return true
			end
		end
	end
	return false
end

-- Check a board for a winning position
function check_board(board)
	return (
		check_marks(board.marks, board_size, 1) or
		check_marks(board.marks, 1, board_size)
	)
end

-- Score a board based on marks
function score_board(board)
	local score = 0
	for i = 1, #board.values, 1 do
		if board.marks[i] == 0 then
			score = score + board.values[i]
		end
	end
	return score
end

-- Read input
local lines = fs.read_lines(arg[1])

-- Parse balls from input
local balls = {}
for value in string.gmatch(lines[1], "([^,]+)") do
	table.insert(balls, tonumber(value))
end

-- Parse boards from input
local boards = {}
for i = 3, #lines, 6 do
	table.insert(boards, parse_board(lines, i))
end

-- "Draw" balls until all winning boards have been found
local winning_order = {}
for i, ball in ipairs(balls) do
	-- Mark and check boards for winning positions
	for board_ordinal, board in ipairs(boards) do
		if board.score == nil then
			mark_board(board, ball)
			if check_board(board) then
				-- This board has won
				local score = score_board(board)
				board.score = score * ball
				table.insert(winning_order, board_ordinal)
			end
		end
	end

	-- Exit when all boards have won
	if #winning_order >= #boards then
		break
	end
end

-- Get winning and losing boards
local winner = boards[winning_order[1]]
local loser = boards[winning_order[#winning_order]]

print("Day 4, Part 1: " .. winner.score)
print("Day 4, Part 2: " .. loser.score)
