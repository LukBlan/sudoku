require 'colorize'

class BoardDisplay
  def display_on_console(board, console_formatter)
    grid = board.grid
    line = get_line(console_formatter, grid.length)

    grid.each_with_index do |row, index|
      if index % 3 == 0
        puts(line)
      end

      display_row(row)
      puts
    end

    puts(line)
  end

  def display_row(row)
    row.each_with_index do |tile, index|
      if index % 3 == 0
        print("|")
      end
      tile_value = get_tile_value(tile)
      print(" #{tile_value} ")
    end

    print("|")
  end

  def get_tile_value(tile)
    tile_value = tile.to_s

    unless tile.is_given
      tile_value = tile_value.colorize(:red)
    end

    tile_value
  end

  def get_line(console_formatter, length)
    line = " "
    size = length / 3
    spaced_line = "#{console_formatter.get_line(length)} "
    size.times { line += spaced_line }
    line
  end
end
