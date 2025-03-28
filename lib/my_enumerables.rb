module Enumerable
  # Your code goes here
  def my_each_with_index
    arr = self
    counter = 0
    for i in arr
      arr =  yield(i, counter)
      counter += 1
    end
    self
  end

  def my_select
    select_arr = []
      self.my_each do |i|
        if yield(i)
          select_arr.push(i)
        end
      end
    select_arr
  end

  def my_all?
    select_arr = []
    self.my_each do |i|
      if yield(i)
        select_arr.push(i)
      end
    end
    select_arr == self
  end

  def my_any?
    arr = self.my_select {|value| yield(value)}
    arr.length > 0
  end

  def my_none?
    arr = self.my_select {|value| yield(value)}
    arr.length == 0
  end

  def my_count
    if block_given?
      arr = self.my_select {|value| yield(value)}
      arr.length
    else
      self.length
    end
  end

  def my_map
    arr = []
    self.my_each do |i|
      arr.push(yield(i))
    end
    arr
  end
  
  def my_inject(initial_value)
    self.each do |i|
      initial_value = yield(initial_value, i)
    end
    initial_value
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    arr = self
    for i in arr
      arr =  yield(i)
    end
    self
  end
end
