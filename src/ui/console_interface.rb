class ConsoleInterface
  def initialize(console_formatter, file_reader, user_input_getter)
    @console_formatter = console_formatter
    @file_reader = file_reader
    @board = nil
    @user_input_getter = user_input_getter
  end

  def init(board_factory, board_display)
    self.show_welcome_message("Welcome to Sudoku")
    self.show_available_files
    puts
    self.generate_board(board_factory)
    self.game_loop(board_display)
    system("clear")
    self.show_game_over_message(board_display)
  end

  def show_game_over_message(board_display)
    self.show_welcome_message("Game Over")
    board_display.display_on_console(@board, @console_formatter)
  end

  def game_loop(board_display)
    while !@board.game_over?
      system("clear")
      board_display.display_on_console(@board, @console_formatter)
      coordinates = @user_input_getter.get_coordinates(@board, @console_formatter)
      number = @user_input_getter.get_number(@board.length, @console_formatter)
      @board.mark_grid(coordinates, number)
    end
  end

  def generate_board(board_factory)
    file_name = get_file_from_user_input
    @board = board_factory.create(@file_reader, file_name)
  end

  def show_welcome_message(message)
    @console_formatter.display_message_between_dashes(message)
  end

  def show_available_files
    files = @file_reader.get_available_files
    puts("Available Files: ")
    files.each do |file|
      @console_formatter.print_indent_message(file)
    end
  end

  def get_file_from_user_input
    print("Select a game file: ")
    gets.chomp
  end
end
