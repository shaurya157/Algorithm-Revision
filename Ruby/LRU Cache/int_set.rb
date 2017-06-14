class IntSet
  def initialize
    @store = Array.new(20) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
  end

  def include?(num)
    self[num].include?(num)
  end

  def remove(num)
    return false if include?(num)
    self[num].delete(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end
