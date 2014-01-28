class UI
  def initialize(input, output)
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
    @output.puts "\e[H\e[2J"
  end
end
