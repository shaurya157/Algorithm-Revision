class Node
  attr_accessor :value, :prev, :next
  def initialize(key = nil, value = nil)
    @value = value
    @key = value
    @prev = nil
    @next = nil
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def append(key, val)
    node = Node.new(key, val)
    @tail.prev.next = node
    @tail.prev, @node.prev = node, @tail.prev
    node.next = @tail
  end

  def remove(key)
    node = get_node(key)
    node.prev, node.next = node.next, node.prev

    node
  end

  def update(key, val)
    node = get_node(key)
    node.val = val
  end

  def get(key)
    each {|link| return link.value if link.key == key}
    nil
  end

  def get_node(key)
    each {|link| return link if link.key == key}
  end

  def include?(key)
    any? {|link| link.key == key}
  end

  def each
    current_link = @head.next
    until current_link == @tail
      yield current_link
      current_link = current_link.next
    end
  end

  def first
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end
end
