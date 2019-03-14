# OYSTERCARD CHALLENGE

### Our user stories are:


1.  In order to use public transport
    As a customer
    I want money on my card

2.  In order to keep using public transport
    As a customer
    I want to add money to my card

3.  In order to protect my money from theft or loss
    As a customer
    I want a maximum limit (of £90) on my card

4.  In order to pay for my journey
    As a customer
    I need my fare deducted from my card

5.  In order to get through the barriers.
    As a customer
    I need to touch in and out.

6.  In order to pay for my journey
    As a customer
    I need to have the minimum amount (£1) for a single journey.

7.  In order to pay for my journey
    As a customer
    When my journey is complete, I need the correct amount deducted from my card

8.  In order to pay for my journey
    As a customer
    I need to know where I've travelled from

9.  In order to know where I have been
    As a customer
    I want to see all my previous trips

10. In order to know how far I have travelled
    As a customer
    I want to know what zone a station is in

11. In order to be charged correctly
    As a customer
    I need a penalty charge deducted if I fail to touch in or out



### Which we can break down as follows:


Plan1:    User will check balance and balance will be returned.

Plan2:    User will top-up by a certain amount and the balance will change by that
          amount.

Plan3:    If the user tries to top-up to a balance higher than the limit an error
          will be raised.

Plan4:    If user pays for something then money is removed from their balance.

Plan5a:   Tell us a user's commuting status.

Plan5b:   Change user's commuting status when they touch in.

Plan5c:   Change user's commuting status when they touch out.

Plan6:    If a user tries to start a journey with less than £1 then an error will
          be raised.

Plan7:    When a user ends a journey their balance will decrease.

Plan8:    When a user touches in, store the station somewhere.

Plan9:    When a user completes a journey, store the entry and exit stations.

Plan10:   When a user looks at their journey history they can see which zones they
          travelled to.

Plan 11:  When a user starts a journey without ending the previous one or ends
          one without starting charge them a penalty. Otherwise charge a standard
          fare.





|CLASSES|METHODS|VARIABLES|CONSTANTS|
|---------|--------------|--------------|--------------|
|**card**|top_up, touch_in, touch_out, update, deduct, in_journey?, max_reached_message, max_reached, min_balance_message|@balance, @journey, @journeys|REQUIRED_BALANCE|
|**station**|   |@name, @zone|   |
|**journey**|start, finish, in_journey?, calculate fare, process_journey, store, current, complete?|@entry_station, @exit_station, @current, @fare, @card|MIN_CHARGE, PENALTY_FARE|
