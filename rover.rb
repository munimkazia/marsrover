class Rover
	attr_reader :rover
	attr_reader :right
	attr_reader :top
	
	def initialize x, y
		@right = x
		@top = y
		@rover = {
			x: 0,
			y: 0,
			direction: :n
		}
	end

  # Resets the rover's position and direction
	def set_position x, y, direction
		@rover[:x] = x
		@rover[:y] = y
		@rover[:direction] = direction.downcase.to_sym
	end

  # Moves the rover forward
	def move
		case @rover[:direction]
      when :n
        if @rover[:y] < @top
          @rover[:y] += 1
        end

      when :w
        if @rover[:x] > 0
          @rover[:x] -= 1
        end

      when :s
        if @rover[:y] > 0
          @rover[:y] -= 1
        end

      when :e
        if @rover[:x] < @right
          @rover[:x] += 1
        end
    end
  end

  # Turns the rover. Argument can be 'L' or 'R'
  def turn new_direction
    directions = [:n, :e, :s, :w]
    index = directions.index(@rover[:direction])
    if new_direction == 'L'
      index -=1
    else
      index += 1
    end
    if index > 3 
      index = (index+1) % 4 - 1
    end
  @rover[:direction] =  directions[index]

  end

  # Simple helper which returns the rover's current position and direction as a string
  def to_s
    @rover[:x].to_s + ' ' + @rover[:y].to_s + ' ' + @rover[:direction].to_s.upcase
  end

end
