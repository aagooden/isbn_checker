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

	def test_check_if_number_is_10_digits_long_true_if_is
		num = "123456789x"
		assert_equal(true, validate_length(num))
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


	def test_return_boolean
		num = "0471958697"
		assert_equal(TrueClass, validate_ten_number(num).class)
	end

	def test_check_known_valid_isbn_number_returns_true
		num = "0471958697"
		assert_equal(true, validate_ten_number(num))
	end

	def test_check_known_invalid_isbn_number_returns_false
		num = "0471958699"
		assert_equal(false, validate_ten_number(num))
	end


	def test_check_known_valid_isbn_number_with_x_returns_true
		num = "877195869x"
		assert_equal(true, validate_ten_number(num))
	end

	def test_check_known_valid_isbn_number_with_capital_X_returns_true
		num = "877195869X"
		assert_equal(true, validate_ten_number(num))
	end


	def test_prepare_and_validate_functions_working_together_properly_true
		num = " 877 195 869X "
		prepared = prepare(num)
		assert_equal(true, validate_length(prepared))
		assert_equal(true, validate_ten_number(prepared))
	end

		def test_prepare_and_validate_functions_working_together_properly_true_and_false
		num = " 877 195 861X "
		prepared = prepare(num)
		assert_equal(true, validate_length(prepared))
		assert_equal(false, validate_ten_number(prepared))
	end


	def test_prepare_and_validate_functions_working_together_properly_true_and_true_no_x
		num = " 047 19586 9 7 "
		prepared = prepare(num)
		assert_equal(true, validate_length(prepared))
		assert_equal(true, validate_ten_number(prepared))
	end

	def test_prepare_and_validate_functions_working_together_properly_true_and_false_no_x
		num = " 047 19586 9 7 "
		prepared = prepare(num)
		assert_equal(true, validate_length(prepared))
		assert_equal(true, validate_ten_number(prepared))
	end

#tests for 13 digit numbers starts here

	def test_check_if_number_is_not_13_digits_long_false_if_not
		num = "123456789123"
		assert_equal(false, validate_length(num))
	end

	def test_check_if_number_is_not_13_digits_long_false_if_not_short_num
		num = "1234560"
		assert_equal(false, validate_length(num))
	end

	def test_check_if_number_is_13_digits_long_true_if_is
		num = "1234567890123"
		assert_equal(true, validate_length(num))
	end




end


