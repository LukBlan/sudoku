require_relative './services/file_reader'
require_relative './ui/console_formatter'
require_relative './ui/console_interface'
require_relative './domain/board/board_factory'
require_relative './ui/board_display'

# services
file_reader = FileReader.new("./../game-files")

# domain
board_factory = BoardFactory.new

# ui
board_display = BoardDisplay.new(:blue, :red)
console_formatter = ConsoleFormatter.new(48)
console_interface = ConsoleInterface.new(console_formatter, file_reader)
console_interface.init(board_factory, board_display)