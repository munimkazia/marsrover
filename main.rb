require "./rover.rb"

File.foreach('input.txt').with_index do |line, line_num|
	
  if line_num == 0
    coords = line.split(' ').map { |x| x.to_i } 
    $r = Rover.new(coords[0], coords[1])
    next
  end

	#Odd lines have starting position
  if line_num % 2 == 1
    start = line.split(' ')
    $r.set_position start[0].to_i, start[1].to_i, start[2]
  end 

  #Even lines have direction
  if line_num % 2 == 0
    line.chomp.each_char do |char|
      if char == 'M'
        $r.move
      else
        $r.turn(char)
      end
    end

    puts $r
  end

end