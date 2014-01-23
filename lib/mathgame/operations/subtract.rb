require 'mathgame/operations/operator'
class Subtract < Operator
  def initialize(left, right)
    @left = left
    @right = right
  end
  def operator_string
    "-"
  end
  def self.precedence
    Add.precedence
  end
  def result
    @left.result - @right.result
  end
end
