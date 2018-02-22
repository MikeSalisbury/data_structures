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
    raise "index out of bounds" if index >= @length
    return @store[index]
  end

  # O(1)
  def []=(index, value)
      raise "index out of bounds" if index > @capacity
      @store[index] = value
  end

  # O(1)
  def pop
    if @length == 0
      raise "index out of bounds"
    else
      popped = @store[-1]
      @store = @store[0...-1]
      @length -= 1
      popped
    end
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @capacity - @length == 0
      resize!
    end
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
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
    temp_arr = []
    @store.each do |el|
      temp_arr.push(el)
    end
    @capacity *= 2
    @store = temp_arr
  end
end
