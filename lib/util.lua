local exports = {}

function exports.split_words(value)
	local words = {}
	for word in value:gmatch("%w+") do
		table.insert(words, word)
	end
	return words
end

return exports
