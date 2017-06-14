class MaxIntSet
  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(val)
    raise 'Out of bounds!' if val >= @store.length
    @store[val] = true
  end

  def remove(val)
    raise 'Out of bounds!' if val >= @store.length
    @store[val] = false
  end

  def include?(val)
    raise 'Out of bounds!' if val >= @store.length
    @store[val]
  end
end
