class ConsoleFormatter
  def initialize(line_length)
    @line_length = line_length
  end

  def display_message_between_dashes(message)
    line = self.get_line
    message_in_middle = get_text_in_middle(message)

    puts(line)
    puts(message_in_middle)
    puts(line)
  end

  def print_indent_message(message)
    puts("    #{message}")
  end

  def get_line
    line = ""
    @line_length.times { line += "-" }
    line
  end

  def get_text_in_middle(message)
    text = ""
    middle_point = @line_length / 2
    message_offset_to_middle = message.length / 2
    white_spaces_amount = middle_point - message_offset_to_middle

    white_spaces_amount.times { text += " "}
    text + message
  end
end
