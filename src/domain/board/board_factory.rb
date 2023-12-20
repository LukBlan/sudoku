require_relative './board'
require_relative './../tile'

class BoardFactory
  def create(filer_reader, file_name)
    file_lines = filer_reader.read_file(file_name)
    grid = self.generate_grid(file_lines)
    Board.new(grid)
  end

  def generate_grid(lines)
    lines.map do |row|
      row.split("").map do |tile_number|
        number = tile_number.to_i
        given_value = false

        if number != 0
          given_value = true
        end

        Tile.new(number, given_value)
      end
    end
  end
end
