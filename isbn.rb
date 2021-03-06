def prepare(num)

#preparing the number by getting rid of spaces
	num.delete!(" ")
	num.delete!("-")
	return num
end


def validate_length(num)
	valid = false

	if num.length == 10 || num.length == 13
		valid = true
	end

	return valid
end


def validate_ten_number(num)
	valid = true

#setting my check sum here... if it is "x" or "X" check sum is 10 else check is converted to integer for following calculation
	check = num[num.length - 1]

	if check == "x" || check =="X"
		check = 10
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
		valid = true
	else
		valid = false
	end

	return valid

end

def validate_13_number(num)

#defining the check value
	check = num[num.length - 1]
	check = check.to_i

#deleting the last digit for easier calculation
	num[num.length - 1] = ""

	switch = true #switches from true to false to flag the correct multiplier
	multiplier = 1
	sum = 0

#main validation calculation
	num.each_char do |char|
		if switch == true 
			multiplier = 1
		else
			multiplier = 3
		end

	sum = sum + (char.to_i * multiplier)
		switch = !switch
	end


	sum = (10 - (sum % 10)) % 10



	if sum == check
		valid = true
	else
		valid = false
	end


	return valid
end

system ("clear")
puts "What is you ISBN number?"
num = gets.chomp

prepared = prepare(num)

length_valid = validate_length(prepared)
if length_valid == false

elsif prepared.length == 10
	valid = validate_ten_number(prepared)
elsif prepared.length == 13
	valid = validate_13_number(prepared)
end


if valid == true
	puts "The number #{num} is a valid ISBN number."
else
	puts "The number #{num} is NOT a valid ISBN number."
end





