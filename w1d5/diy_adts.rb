class Stack
  def initialize
    #create ivar to store stack here!
    @stack = []
  end

  def add(el)
    #adds an element to the stack
    @stack.push(el)
  end

  def remove
    #removes one element from the stack
    @stack.pop
  end

  def show
    #return a copy of the stack
    @stack
  end
end
#
# ---1---
# --2-3--
# -4-5-6-
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    lookup(key) == false ? @map << [key, value] : @map[lookup(key)][1] = value
  end

  def lookup(key)
    @map.each_with_index { |el, idx| return idx if key == el[0] }
    false
  end

  def remove(key)
    idx = lookup(key)
    idx ? @map.delete_at(idx) : %q(key is not included in map)
  end

  def show
    @map
  end

end
