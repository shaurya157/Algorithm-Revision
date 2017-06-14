require './hash_map.rb'
require './linked_list.rb'

class LRUCache
  def initialize(max, prc)
    @max = max
    @store = LinkedList.new
    @map = HashMap.new
    @prc = prc
  end

  def count
    map.count
  end

  def get(key)
    if map[key]
      link = map[key]
      update_link!(link)

      link.val
    else
      calc!(key)
    end
  end

  private

  def calc!(key)
    val = @prc.call(key)
    new_link = @store.append(key, val)
    map[key] = new_link

    eject! if count > @max
  end

  def update_link!(link)
    @store.remove(link.key)
    @store.append(link.key, link.val)
  end

  def eject!
    rm_link = @store.remove(@store.first)
    @map.remove(rm_link.key)
    nil
  end
end
