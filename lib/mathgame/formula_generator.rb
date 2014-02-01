class FormulaGenerator
   def initialize(height, operators, operands, value_generator, rand = Random.new)
    @height = height
    @operators = operators
    @operands = operands
    @value_generator = value_generator
    @rand = rand
  end
  def tree
    tree_aux(@height)
  end
  def tree_aux(height)
    if height == 0
      pick(@operands).new(@value_generator.value)
    else
     operator = pick(@operators).new(tree_aux(height-1), tree_aux(height-1))
   end
  end
  def inc_height
    @height += 1
  end
  alias :increase_formula_complexity :inc_height
  def dec_height
    @height -= 1
    @height = 0 if @height < 0
  end
  alias :decrease_formula_complexity :dec_height
  def decrease_value_complexity
    @value_generator.decrease_complexity
  end
  def increase_value_complexity
    @value_generator.increase_complexity
  end
  private
  def pick(array)
    array.shuffle(random: @rand).shift
  end

end
