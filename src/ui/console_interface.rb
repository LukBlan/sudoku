class ConsoleInterface
  def initialize(console_formatter)
    @console_formatter = console_formatter
  end

  def init
    puts("Hi there!")
  end
end
