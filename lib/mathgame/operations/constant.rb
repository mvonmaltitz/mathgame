require 'mathgame/operations/operator'
class Constant < Operator
  def initialize(number)
    @number = number
  end
  def to_s
    @number.to_s
  end
  def self.precedence
    100
  end
  def self.associative
    true
  end
  def result
    @number
  end
end
