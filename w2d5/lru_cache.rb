class LRUCache

  def initialize(size)
    @size = size
    @array = []
  end

  def count
    #returns number of elements currently in cache
    @array.count
  end

  def add(el)
    #adds element to cache according to LRU principle
    idx = @array.index(el).nil? ? nil : @array.index(el)
    if idx
      @array.delete_at(idx)
    elsif count == size
      @array.shift
    end
    @array << el
  end

  def show
    #shows the items in the cache, with the LRU item first
    @array
  end

  private
  #helper methods go here

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})
