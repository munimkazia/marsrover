require "./rover.rb"
require 'test/unit'

class TestRover < Test::Unit::TestCase

	def test_initialize
		test = Rover.new 3, 4
		assert_equal test.right, 3, "initialize right boundary test"
		assert_equal test.top, 4, "initialize top boundary test"
		expected = { x: 0, y:0, direction: :n }
		assert_equal expected, test.rover, "initialize rover test"
	end

	def test_position
		test = Rover.new 10, 10
		
		test.set_position 2, 3, 'W'
		expected = { x: 2, y: 3, direction: :w }
		assert_equal expected, test.rover, "rover position test facing west"

		test.set_position 6, 2, 'S'
		expected = { x: 6, y: 2, direction: :s }
		assert_equal expected, test.rover, "rover position test facing south"

		test.set_position 4, 5, 'N'
		expected = { x: 4, y: 5, direction: :n }
		assert_equal expected, test.rover, "rover position test facing north"

		test.set_position 7, 1, 'E'
		expected = { x: 7, y: 1, direction: :e }
		assert_equal expected, test.rover, "rover position test facing east"

	end

	def test_turn
		test = Rover.new 10, 10
		test.set_position 0, 0, 'N'

		test.turn 'L'
		assert_equal test.rover[:direction], :w, "rover turning left from north test"

		test.turn 'L'
		assert_equal test.rover[:direction], :s, "rover turning left from west test"

		test.turn 'L'
		assert_equal test.rover[:direction], :e, "rover turning left from south test"

		test.turn 'L'
		assert_equal test.rover[:direction], :n, "rover turning left from east test"

		test.turn 'R'
		assert_equal test.rover[:direction], :e, "rover turning right from north test"

		test.turn 'R'
		assert_equal test.rover[:direction], :s, "rover turning right from east test"

		test.turn 'R'
		assert_equal test.rover[:direction], :w, "rover turning right from south test"

		test.turn 'R'
		assert_equal test.rover[:direction], :n, "rover turning right from west test"
	end

	def test_move
		test = Rover.new 10, 10

		test.set_position 5, 5, 'N'
		test.move
		expected = { x: 5, y: 6, direction: :n }
		assert_equal expected, test.rover, "rover moving north test"

		
		test.set_position 5, 5, 'S'
		test.move
		expected = { x: 5, y: 4, direction: :s }
		assert_equal expected, test.rover, "rover moving south test"
		
		test.set_position 5, 5, 'E'
		test.move
		expected = { x: 6, y: 5, direction: :e }
		assert_equal expected, test.rover, "rover moving east test"
		
		test.set_position 5, 5, 'W'
		test.move
		expected = { x: 4, y: 5, direction: :w }
		assert_equal expected, test.rover, "rover moving west test"

		test.set_position 10, 10, 'N'
		test.move
		expected = { x: 10, y: 10, direction: :n }
		assert_equal expected, test.rover, "rover moving north on boundary test"

		test.set_position 10, 10, 'E'
		test.move
		expected = { x: 10, y: 10, direction: :e }
		assert_equal expected, test.rover, "rover moving east on boundary test"
		
		test.set_position 0, 0, 'S'
		test.move
		expected = { x: 0, y: 0, direction: :s }
		assert_equal expected, test.rover, "rover moving south on boundary test"
    
		test.set_position 0, 0, 'W'
		test.move
		expected = { x: 0, y: 0, direction: :w }
		assert_equal expected, test.rover, "rover moving west on boundary test"

	end
end
