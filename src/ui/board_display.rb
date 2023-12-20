require 'colorize'

class BoardDisplay
  def initialize(index_color, input_tile_color)
    @index_color = index_color
    @input_tile_color = input_tile_color
  end

  def display_on_console(board, console_formatter)
    grid = board.grid
    line = get_line(console_formatter, grid.length)
    index_line = get_index_line(grid.length)

    puts(index_line)
    grid.each_with_index do |row, index|
      if index % 3 == 0
        puts(line)
      end

      display_row(row, index + 1)
      puts
    end

    puts(line)
  end

  def display_row(row, row_index)
    print("#{row_index} ".colorize(@index_color))

    row.each_with_index do |tile, index|
      if index % 3 == 0
        print("|")
      end

      tile_value = get_tile_value(tile)
      print(" #{tile_value} ")
    end

    print("|")
  end

  def get_index_line(size)
    line = "   "

    (1..size).each do |index|
      line += " #{index} "

      if index % 3 == 0
        line += " "
      end
    end

    line.colorize(@index_color)
  end

  def get_tile_value(tile)
    tile_value = tile.to_s

    unless tile.is_given
      tile_value = tile_value.colorize(@input_tile_color)
    end

    tile_value
  end

  def get_line(console_formatter, length)
    line = "   "
    size = length / 3
    spaced_line = "#{console_formatter.get_line(length)} "
    size.times { line += spaced_line }
    line
  end
end
