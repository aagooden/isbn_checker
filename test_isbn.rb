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





end


