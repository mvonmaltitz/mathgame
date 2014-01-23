require 'mathgame/operations/operator'
class Multiply < Operator
  def initialize(left, right)
    @left = left
    @right = right
  end
  def operator_string
    "*"
  end
  def self.precedence
    Add.precedence + 1
  end
  def self.associative
    true
  end
  def result
    @left.result * @right.result
  end
end
