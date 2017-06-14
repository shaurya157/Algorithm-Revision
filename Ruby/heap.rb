class BinaryMinHeap
  def initialize(&prc)
    @prc = prc
    @store = []
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[@store.length - 1] = @store[@store.length - 1], @store[0]
    num = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, @store.length, &@prc)

    num
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store, @store.length - 1, @store.length, &@prc)
  end

  attr_accessor :prc, :store

  def self.child_indices(len, parent_index)
    x = [(2 * parent_index) + 1, (2 * parent_index) + 2].select { |num| num < len }
  end

  def self.parent_index(child_index)
    child_index.zero? ? 0 : (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    max = parent_index(array.length - 1)
    min_or_max = prc.call(1, 2) ? false : true

    i = 0
    while i <= max
      replaced_child = min_or_max ? child_indices(len, i).max_by {|i| array[i]} : child_indices(len, i).min_by {|i| array[i]}

      if  prc.call(array[replaced_child], array[i])
        array[i], array[replaced_child] = array[replaced_child], array[i]
        i = replaced_child
      else
        break
      end
    end
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    i = len - 1
    while i > 0
      parent_idx = parent_index(i)
      # array[i] < array[parent_idx]
      if prc.call(array[i], array[parent_idx])
        array[i], array[parent_idx] = array[parent_idx], array[i]
        i = parent_idx
      else
        break
      end
    end
  end
end
