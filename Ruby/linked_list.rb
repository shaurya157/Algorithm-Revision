class Node
  attr_accessor :value, :prev, :next
  def initialize(value = nil)
    @value = value
    @prev = nil
    @next = nil
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end
end
