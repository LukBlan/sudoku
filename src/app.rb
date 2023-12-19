require_relative './services/file_reader'
require_relative './ui/console_formatter'
require_relative './ui/console_interface'
require_relative './domain/board/board_factory'

# services
file_reader = FileReader.new("./../game-files")

# Domain
board_factory = BoardFactory.new

# Ui
console_formatter = ConsoleFormatter.new(48)
console_interface = ConsoleInterface.new(console_formatter, file_reader)
console_interface.init(board_factory)