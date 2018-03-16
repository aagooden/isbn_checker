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

	return valid

end


def validate_number(num)
	valid = true

	return valid
end


