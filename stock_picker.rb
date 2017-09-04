# Make a stock_picker that takes an array of profits (index = day) and find the 
# days that provides the greatest profit.

def stock_picker(stocks)
  i_min = 0
  j_max = 0
  difference_max = 0

  stocks.each_with_index do |i_stock, i_index|
    # Start j-loop from i_index, since you have to buy before you sell
    stocks[i_index..-1].each_with_index do |j_stock, j_index|
      puts "i_index = #{i_index}. j_index = #{j_index}."
      puts "Is #{j_stock} - #{i_stock} == #{j_stock - i_stock} greater than #{difference_max}?"
      if j_stock - i_stock > difference_max
        puts "Yes it is!"
        difference_max = j_stock - i_stock
        i_min = i_index
        # For j_max I add i_index, since the j-loop starts from i_index (and therefor not 0)
        j_max = j_index + i_index
      end
    end
  end

  puts "[#{i_min},#{j_max}] # for a profit of $#{stocks[j_max]} - $#{stocks[i_min]} == $#{difference_max}"
end

# stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12