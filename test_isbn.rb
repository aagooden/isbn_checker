require "minitest/autorun"
require_relative "isbn.rb"

class Isbn_test < Minitest::Test

	def test_boolean
		assert_equal(true, true)
	end

	def test_return_string
		num = "2"
		assert_equal(String, prepare(num).class)
	end

	def test_return_no_spaces
		num = " 2 3 4 x "
		assert_equal("234x", prepare(num))
	end

	def test_check_if_number_is_not_10_digits_long_false_if_not
		num = "1234567890x"
		assert_equal(false, validate_length(num))
	end

	def test_check_if_number_is_not_10_digits_long_false_if_not_short_num
		num = "1234560x"
		assert_equal(false, validate_length(num))
	end

	def test_prepare_and_validate_functions_working_together_properly
		num = " 12 345 67890 x "
		prepared = prepare(num)
		assert_equal(false, validate_length(prepared))
	end

end


