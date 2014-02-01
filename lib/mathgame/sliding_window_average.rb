class SlidingWindowAverage
  def initialize(default_length)
    @length = default_length
    @values = Array.new
    @count = 0
    @sum = 0
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
  def overall_average
    @sum.to_f / @count
  end
  alias :overall_avg :overall_average
  private
  def add_value(value)
    @sum += value
    @count += 1
    @values << value
    @values.shift while @values.length > @length
  end
end
