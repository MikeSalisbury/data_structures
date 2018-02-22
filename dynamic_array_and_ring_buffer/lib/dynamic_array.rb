require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = []
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    if @store[index]
      @store[index]
    else
      raise "index out of bounds"
    end
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    popped = @store[-1]
    @store = @store[0...-1]
    @length -= 1
    popped
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @length += 1
    @store[@length + 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    shifted = @store[0]
    @store = @store[1..-1]
    @length -= 1
    shifted
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @length += 1
    @store = [val] + @store

  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    
  end
end
