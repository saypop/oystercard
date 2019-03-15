require './lib/oystercard.rb'
require './lib/station.rb'

#require './lib/Journey.rb'
# # Step04
# card = Oystercard.new
# card.balance # returns value

# # Step05
# card = Oystercard.new
# balance1 = card.balance
# card.top_up(100)
# balance2 = card.balance
# balance2 - balance1 == 100

# # Step06
# card = Oystercard.new
# card.top_up(90)
# p card.top_up(1) ==  "Unsuccessful. You have the maximum allowed amount on your card."

# # Step07
# card = Oystercard.new
# card.top_up(90)
# card.deduct(10)
# p card.balance == 80

# # Step08a
# card = Oystercard.new
# p card.in_journey? == false

# # Step08b
# card = Oystercard.new
# card.touch_in
# card.in_journey == true

# # Step08c
# card = Oystercard.new
# card.touch_out
# card.in_journey == false

# # Step09
# card = Oystercard.new
# p card.touch_in == "Sorry, your balance is too low to start this journey."

# # Step10
# card = Oystercard.new
# card.top_up(90)
# card.touch_in
# p card.entry_station

# # Step11
# card = Oystercard.new
# card.top_up(90)
# card.touch_in("entry_station", 1)
# card.touch_out("exit_station", 5)
# p card.journeys

# # Step12
# card = Oystercard.new
# dalston = Station.new("Dalston", 2)
# earls_court = Station.new("Earl's Court", 1)
# card.top_up(90)
# card.touch_in(dalston)
# card.touch_out(earls_court)
# card.touch_out(earls_court)

# Step13
card = Oystercard.new
p card
card.top_up(90)
p card.balance
dalston = Station.new("Dalston", 2)
earls_court = Station.new("Earl's Court", 1)
card.touch_out(earls_court)
p card.balance
card.touch_in(dalston)
card.touch_out(earls_court)
p card.balance
p card.update
