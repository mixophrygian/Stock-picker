#The Stock_picker method takes in an array of stock prices, one for each hypothetical day. 
#It returns a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#stock_picker([17,3,6,9,15,8,6,1,10]) will return "Buy on day 1 and sell on day 4 for a profit of $12!"
#In this method you must "buy" before you "sell."


def stock_picker(arr)
	all_days = arr.to_a
	day_1_and_on = all_days.drop(1) #removes first day because you can't buy and sell on the same day
	max_profit = 0
	buy_day = 0
	sell_day = 1
	all_days.each_with_index do |buy_price, buy_index| #For all days that you can buy
		day_1_and_on.each_with_index do |sell_price, sell_index| #and all days that you can sell (day 1 and on)
			if buy_index <= sell_index #As long as you're selling AFTER you're buying
				if sell_price - buy_price > max_profit 
					max_profit = sell_price - buy_price 
					sell_day = sell_index + 1 #adds back the removed index to correspond to the original array of days
					buy_day = buy_index
				end
			end
		end
	end

	puts "Buy on day #{buy_day} and sell on day #{sell_day} for the maximum profit of $#{max_profit}!"
end

stock_picker([17,3,6,9,15,8,6,1,10])
