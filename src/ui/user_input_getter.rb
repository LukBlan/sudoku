class UserInputGetter
  def get_coordinates(board_length)
    loop do
      printf("Give (X,Y) coordinates (e.g 0,0): ")
      coordinates = gets.chomp.split(",").map(&:to_i)

      if self.valid_coordinates(coordinates, board_length)
        return coordinates
      end

      puts("Invalid coordinates, try again")
    end
  end

  def get_number(board)
    print("Give value: ")
    gets.chomp
  end

  def valid_coordinates(coordinates, board_length)
    coordinates.all? { |coordinate| coordinate > 0 && coordinate <= board_length }
  end
end
