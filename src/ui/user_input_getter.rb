class UserInputGetter
  def get_coordinates(board, console_formatter)
    loop do
      printf("Give (row,column) coordinates (e.g 0,0): ")
      coordinates = gets.chomp.split(",").map { |coordinate| coordinate.to_i - 1 }

      if self.valid_coordinates(coordinates, board)
        return coordinates
      end

      console_formatter.print_indent_message("Invalid coordinates, try again")
    end
  end

  def get_number(board_length, console_formatter)
    loop do
      print("Give value: ")
      number = gets.chomp

      if valid_number?(number, board_length)
        return number.to_i
      end

      console_formatter.print_indent_message("Invalid number, try again")
    end
  end

  def valid_number?(number, board_length)
    number != "" && number.to_i > 0 && number.to_i <= board_length
  end

  def valid_coordinates(coordinates, board)
    coordinates_inside_board_range(coordinates, board.length) && not_a_given_value(coordinates, board)
  end

  def not_a_given_value(coordinates, board)
    grid = board.grid
    row = coordinates[0]
    column = coordinates[1]
    !grid[row][column].is_given
  end

  def coordinates_inside_board_range(coordinates, board_length)
    coordinates.all? { |coordinate| coordinate >= 0 && coordinate < board_length }
  end
end
