require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = Array.new(8)
    @length = 0
    @capacity = 8
    @start = 0
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if @length == 0
    @store[(index + @start) % @capacity]
  end

  # O(1)
  def []=(index, val)
    return "index out of bounds" if index >= @length
    @store[(index + @start) % @capacity] = val
  end

  # O(1)
  def pop
    @store[(@length + @start) % @capacity] = nil
    @length -= 1
  end

  # O(1) ammortized
  def push(val)
    @store[(@length + @start) % @capacity] = val
    @length += 1
  end

  # O(1)
  def shift
    @store[@start] = nil
    @length -= 1
    @start += 1
  end

  # O(1) ammortized
  def unshift(val)
    @start = (@start - 1) % @capacity
    @store[@start] = val
    @length += 1
  end


  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!

  end
end
