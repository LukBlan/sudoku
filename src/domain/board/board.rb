class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def mark_grid(coordinates, number)
    column = coordinates[0].to_i - 1
    row = coordinates[1].to_i - 1
    tile = Tile.new(number, false)
    @grid[column][row] = tile
  end

  def length
    @grid.length
  end

  def game_over?
    row_win(@grid)
  end

  def row_win(grid)
    hash_numbers = get_hashed_numbers(grid.length)

    grid.all? do |row|
      numbers_in_ladder(row, hash_numbers.clone)
    end
  end

  def numbers_in_ladder(row, hash_numbers)
    row.each do |tile|
      hash_numbers[tile.value] -= 1
    end

    hash_numbers.all? { |key, values| values == 0 }
  end

  def get_hashed_numbers(grid_length)
    numbers = Hash.new { |hash, key| hash[key] = 1}
    (1..grid_length).each { |number| numbers[number] }
    numbers
  end
end
