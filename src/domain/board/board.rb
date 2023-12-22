class Board
  attr_reader :grid
  BLOCK_SIZE = 3

  def initialize(grid)
    @grid = grid
  end

  def mark_grid(coordinates, number)
    column = coordinates[0]
    row = coordinates[1]
    tile = Tile.new(number, false)
    @grid[column][row] = tile
  end

  def length
    @grid.length
  end

  def game_over?
    row_win(@grid) && column_win(@grid) && diagonal_win(@grid) && block_win(@grid)
  end

  def block_win(grid)
    hashed_numbers = get_hashed_numbers(grid.length)
    lines = get_lines(grid)
    lines.all? { |line| numbers_in_ladder(line, hashed_numbers.clone) }
  end

  def get_block_as_line(grid, column_index, row_index)
    line = []
    row_block_index = row_index * 3
    column_block_index = column_index * 3

    BLOCK_SIZE.times do |row|
      BLOCK_SIZE.times do |column|
        line << grid[row_block_index + row][column_block_index + column]
      end
    end

    line
  end

  def diagonal_win(grid)
    diagonal_win_condition(grid) && diagonal_win_condition(grid.reverse)
  end

  def diagonal_win_condition(grid)
    hash_numbers = get_hashed_numbers(grid.length)
    diagonal = []

    (0...grid.length).each do |index|
      diagonal << grid[index][index]
    end

    numbers_in_ladder(diagonal, hash_numbers)
  end

  def row_win(grid)
    hash_numbers = get_hashed_numbers(grid.length)

    grid.all? do |row|
      numbers_in_ladder(row, hash_numbers.clone)
    end
  end

  def column_win(grid)
    row_win(grid.transpose)
  end

  def numbers_in_ladder(line, hash_numbers)
    line.each do |tile|
      hash_numbers[tile.value] -= 1
    end

    hash_numbers.all? { |key, values| values == 0 }
  end

  def get_hashed_numbers(grid_length)
    numbers = Hash.new { |hash, key| hash[key] = 1}
    (1..grid_length).each { |number| numbers[number] }
    numbers
  end

  def get_lines(grid)
    lines = []
    block_amount = grid.length / 3

    (0...block_amount).each do |row_index|
      block_amount.times do |column_index|
        lines << get_block_as_line(grid, column_index, row_index)
      end
    end

    lines
  end
end
