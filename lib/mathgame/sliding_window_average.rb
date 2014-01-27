class SlidingWindowAverage
  def initialize(default_length)
    @length = default_length
    @values = Array.new
  end
  def hit
    add_value 1
  end
  def miss
    add_value 0
  end
  def current_average
    @values.reduce(:+).to_f / @values.length
  end
  alias :avg :current_average
  private
  def add_value(value)
    @values << value
    @values.shift while @values.length > @length
  end
end
