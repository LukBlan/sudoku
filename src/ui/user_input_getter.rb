class UserInputGetter
  def get_coordinates(board_length, console_formatter)
    loop do
      printf("Give (X,Y) coordinates (e.g 0,0): ")
      coordinates = gets.chomp.split(",").map(&:to_i)

      if self.valid_coordinates(coordinates, board_length)
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

  def valid_coordinates(coordinates, board_length)
    coordinates.all? { |coordinate| coordinate > 0 && coordinate <= board_length }
  end
end
