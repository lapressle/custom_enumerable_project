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
