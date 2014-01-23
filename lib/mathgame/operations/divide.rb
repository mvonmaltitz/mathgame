require 'mathgame/operations/operator'
class Divide < Operator
  def initialize(left, right)
    @left = left
    @right = right
  end
  def operator_string
    "/"
  end
  def self.precedence
    Multiply.precedence
  end
  def result
    @left.result.to_f / @right.result
  end
end
