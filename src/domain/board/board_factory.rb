require_relative './board'

class BoardFactory
  def create(filer_reader, file_name)
    lines = filer_reader.read_file(file_name)
    p lines
    Board.new
  end
end
