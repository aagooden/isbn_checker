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

#setting my check sum here... if it is x or X check sum is 10 else check is converted to
	check = num[num.length - 1]
	if check == "x" || check =="X"
		check == 10
	else
		check = check.to_i
	end

#performing validation math

# counter will represent the num's "position (1-length) which
# will be multiplied by char which is the actual integer value of the num
# num.length - 2 is used to account for the index shift AND the fact that the last digit in num is the check sum
	counter = 1
	sum = 0
	for x in (0..num.length - 2) do
		char = num[x].to_i
		sum = sum + (char * counter)
		counter +=1 
	end

#final comparison for validation
	sum = sum % 11
	if sum == check
		return valid
	else
		return false
	end

end


