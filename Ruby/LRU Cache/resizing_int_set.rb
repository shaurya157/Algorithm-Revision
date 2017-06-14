class ResizingIntSet
  def initialize
    @store = Array.new(20) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    validate
    @count += 1

    self[num] << num
  end

  def include?(num)
    self[num].include?(num)
  end

  def remove(num)
    return false if include?(num)
    @count -= 1
    
    self[num].delete(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_store = @store
    @store = Array.new(temp_store.length * 2) { Array.new }

    temp_store.each do |bucket|
      bucket.each do |num|
        insert(num)
      end
    end
  end

  def validate
    resize! if count + 1 > @store.length
  end
end
