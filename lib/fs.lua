local exports = {}

-- Read a file into an array of lines
function exports.read_lines(filename)
	local array = {}
	for line in io.lines(filename) do
		table.insert(array, line)
	end
	return array
end

return exports
