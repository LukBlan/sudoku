require_relative './services/file_reader'
require_relative './domain/board/board_factory'
require_relative './ui/console_formatter'
require_relative './ui/console_interface'
require_relative './ui/board_display'
require_relative './ui/user_input_getter'

# services
file_reader = FileReader.new("./../game-files")

# domain
board_factory = BoardFactory.new

# ui
board_display = BoardDisplay.new(:blue, :green)
console_formatter = ConsoleFormatter.new(48)
user_input_getter = UserInputGetter.new
console_interface = ConsoleInterface.new(console_formatter, file_reader, user_input_getter)

# init
console_interface.init(board_factory, board_display)