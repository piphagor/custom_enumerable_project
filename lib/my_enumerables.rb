module Enumerable
  def my_each_with_index
    for i in 0...self.length
      yield self[i], i
    end
    self
  end

  def my_select
    array = []
    for i in 0...self.length
      if yield self[i]
        array << self[i]
      end
    end
    array
  end

  def my_all?
    i = 0
    while (i < length) && (yield self[i]) do
      i += 1
    end
    i == length
  end

  def my_any?
    for i in 0...self.length
      return true if yield self[i]
    end
    false
  end

  def my_none?
    for i in 0...self.length
      return false if yield self[i]
    end
    true
  end

  def my_count
    if block_given?
      count = 0
      for i in 0...size
        count += 1 if yield self[i]
      end
      return count
    end
    size
  end

  def my_map
    array = []
    for i in 0...size
      array << (yield self[i])
    end
    array
  end

  def my_inject(initial_value)
    result = initial_value
    for i in 0...size
      result = (yield result, self[i])
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for i in 0...self.length
      yield self[i]
    end
    self
  end
end
