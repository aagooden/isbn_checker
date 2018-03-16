def prepare(num)

#preparing the number by getting rid of spaces
	num.delete!(" ")

	return num

end

def validate_length(num)
	valid = true

	if num.length != 10
		valid = false
	end

valid

end
