class UI
  CLEAR_SCREEN_COMMAND =  "\e[H\e[2J"
  def initialize(input = STDIN, output = STDOUT)
    @input = input
    @output = output
  end
  def write_message(message)
    @output.puts message
  end
  def get_answer()
    @input.gets.chomp
  end
  def clear_screen
    @output.puts CLEAR_SCREEN_COMMAND
  end
end
