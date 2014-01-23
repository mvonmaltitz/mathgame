require 'mathgame/operations/operator'
class Add < Operator
  def initialize(left, right)
    @left = left
    @right = right
  end
  def to_s
    "#{@left.to_s} + #{@right.to_s}"
  end
  def result
    @left + @right
  end
end
