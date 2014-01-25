class ValueGenerator
  def initialize(lower_limit, upper_limit, rand = Random.new)
    @rand = rand
    @lower_limit = lower_limit
    @upper_limit = upper_limit
    raise "First limit has to be lower than the second limit" if limits_invalid
  end

  def value
    @lower_limit + @rand.rand(@upper_limit - @lower_limit + 1)
  end
  def inc_lower
    @lower_limit += 1
    @lower_limit = @upper_limit if limits_invalid
  end
  def inc_upper
    @upper_limit += 1
  end
  def dec_lower
    @lower_limit -= 1
  end
  def dec_upper
    @upper_limit -= 1
    @upper_limit = @lower_limit if limits_invalid
  end
  private
  def limits_invalid
     @lower_limit > @upper_limit
  end
end
