class Game
  DEFAULT_OPERATORS = [Add, Subtract, Multiply, Divide]
  DEFAULT_OPERANDS = [Constant]

  def initialize(ui, formulas = nil, performance_measure = SlidingWindowAverage.new(10) )
    @ui = ui
    rand = Random.new
    @formulas = formulas || FormulaGenerator.new(1, DEFAULT_OPERATORS, DEFAULT_OPERATORS, ValueGenerator.new(1,2, rand), rand)
    @performance_measure = performance_measure
  end

  def start
    template = ERB.new File.new("templates/game.erb").read, nil, "%"
    begin
      @formula = @formulas.tree
      @success_rate = @performance_measure.avg
      @ui.clear_screen
      @ui.write_message(template.result(get_binding()))
      @answer = @ui.get_answer
      @correct_result = @formula.result
      @last_answer_was_correct = answer_correct(@answer,@correct_result)
      if(@last_answer_was_correct)
        @performance_measure.hit
      else
        @performance_measure.miss
      end
      calibrate_difficulty
    end until @answer.empty?
  end

  private
  def calibrate_difficulty
    if @success_rate> 0.90
      @formulas.increase_value_complexity
    end
    if @success_rate> 0.75
      @formulas.increase_value_complexity
    end

    if @success_rate < 0.40
      @formulas.decrease_value_complexity
    end
    if @success_rate < 0.20
      @formulas.decrease_value_complexity
    end
  end

  def answer_correct(answer, result)
    (answer.to_f - result).abs < 0.01
  end
  def get_binding
    binding()
  end
end
