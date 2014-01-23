class Operator
  def to_s
    "#{optional_left_brace @left} #{operator_string} #{optional_right_brace @right}"
  end
  def self.precedence
    0
  end
  def precedence
    self.class.precedence
  end
  def self.associative
    false
  end
  def associative
    self.class.associative
  end
  protected

  def optional_left_brace(element)
    if (element.is_a? Operator ) && (self.precedence > element.class.precedence)
      embrace element
    else
      element.to_s
    end
  end
  def optional_right_brace(element)
    if (element.is_a? Operator ) && (self.precedence > element.class.precedence || (! self.associative && self.precedence == element.class.precedence))
      embrace element
    else
      element.to_s
    end
  end
  def embrace(element)
    "(#{element})"
  end
end
