def stock_picker(orig_array)
  buy_sell = Array.new()
  largest_difference = 0
  orig_array.each do |orig_element|
    new_array = orig_array.map {|element| element - orig_element}
    new_array_sorted = new_array.sort
    while orig_array.index(orig_element) >= new_array.index(new_array_sorted.last)
      if new_array_sorted.length == 1
        break
      else
      new_array_sorted.pop
      end
    end
    if (new_array_sorted.last >= 0) && (new_array_sorted.last != nil)
      if largest_difference <= (new_array_sorted.last - orig_element)
        largest_difference = (new_array_sorted.last - orig_element)
        buy_sell.clear
        buy_sell = [orig_array.index(orig_element), new_array.index(new_array_sorted.last)]
      end
    end
  end
  buy_sell
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])

p stock_picker([20, 5, 7, 3, 12, 9, 19, 2, 1])