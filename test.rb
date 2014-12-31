require "./rover.rb"
require 'test/unit'

class TestRover < Test::Unit::TestCase

	def test_initialize
		test = Rover.new 3, 4
		assert_equal test.right, 3, "right boundary test"
		assert_equal test.top, 4, "top boundary test"
		assert_equal test.rover[:x], 0
		assert_equal test.rover[:y], 0
		assert_equal test.rover[:direction], :n
	end

	def test_position
		test = Rover.new 10, 10
		
		test.set_position(2, 3, 'W')
		assert_equal test.rover[:x], 2
		assert_equal test.rover[:y], 3
		assert_equal test.rover[:direction], :w

		test.set_position(6, 2, 'S')
		assert_equal test.rover[:x], 6
		assert_equal test.rover[:y], 2
		assert_equal test.rover[:direction], :s

	end

	
end
