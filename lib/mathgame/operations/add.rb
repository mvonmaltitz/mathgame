require 'mathgame/operations/operator'
class Add < Operator
  def initialize(left, right)
    @left = left
    @right = right
  end
  def operator_string
    "+"
  end
  def self.precedence
    0
  end
  def self.associative
    true
  end
  def result
    @left.result + @right.result
  end
end
