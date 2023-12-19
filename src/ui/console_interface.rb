class ConsoleInterface
  def initialize(console_formatter, file_reader)
    @console_formatter = console_formatter
    @file_reader = file_reader
  end

  def init
    self.show_welcome_message("Welcome to Sudoku")
    self.show_available_files
    puts
    file_name = get_file_from_user_input
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
