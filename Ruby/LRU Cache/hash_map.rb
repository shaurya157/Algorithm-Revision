require './linked_list.rb'

class HashMap
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def each
    @store.each do |bucket|
      bucket.each {|link| yield [link.key, link.val]}
    end
  end

  def set(key, val)
    if include?(key)
      bucket(key).update(key, val)
    else
      resize! if @count + 1 > @store.length
      bucket(key).append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  alias_method :[], :get
  alias_method :[]=, :set

  def remove(key)
    if include?(key)
      bucket(key).remove(key)
      @count -= 1
    else
      nil
    end
  end

  def include?(key)
    bucket(key).include?(key)
  end

  private

  def bucket(key)
    @store[key.hash % @store.length]
  end

  def resize!
    temp_store = @store
    @store = Array.new(@count * 2) { LinkedList.new }
    @count = 0

    temp_store.each do |list|
      list.each do |node|
        set(node.key, node.value)
      end
    end
  end
end
