**About:** This is a Vending Machine CLI application using only Ruby. 
______________________________________

**Instructions:**
**1. In your terminal, run the following commands first to setup, create and seed the database**

 - bundle install
 - rake db:migrate
 - rake db:seed

**2. In your terminal, run the following commands to start and exit the application**

 - Start: ruby bin/run.rb 
 - Exit: ctrl + c (note you will have to use this to exit the application if at any point you get stuck and there is no exit selection)

**3. If you would like a quick way to view the Till without going through the CLI, run rake console then Till.all in your terminal.**

- This should open up a console where you can view the Till table. 
- The changes after a purchase is made should be reflected here. 
- After you are finished reviewing, type exit to leave the console.

**4. In your terminal, run rspec to test that the models were created properly.**
_____________________________________

**Core Features:**
- Login/Sign Up
- View drink menu
- View coins in till
- Purchase drink by selecting payment
- Error handling when the drink is out of stock or there is not enough change in the till
- Exit at multiple points within the application
______________________________________
    
**Relationships:**

	User has many purchases
	User has many drinks through purchases

	Purchases belong to user
	Purchases belong to drink

	Drink has many purchases
	Drink has many users through purchases 
______________________________________


**Table Information:**

    -	User
        o	ID
        o	Name -> string

    -	Purchase
        o	ID
        o	Drink ID 
        o	User ID
        o	Payment Amount -> integer

    -	Drink
        o	ID
        o	Price -> float
        o	Quantity -> integer

    -	Till
        o	ID
        o	Value -> float
        o	Quantity -> integer
___________________________________

**Other Key Features:**

    - The prompt loops when invalid sign-in or selections are made or the soda is out of stock avoiding any unwanted exits
    - Till updates to reflect BOTH received payment and any change dispensed
    - Least amount of coins used when change is dispensed
    - Drink menu updates to reflect when a drink is sold out
    - Change is exact. In the case of the Fanta at $2.70, the user is unable to purchase because the till does not have sufficient change. This could be fixed if 0.05c coins were available. 
_____________________________________

**Bugs:**
    - when certain coins run out in the till, the application stops -> fixed
    - currently when the user selects a payment, the user is only able to select one payment rather than multiple -> fixed
    - user cannot select the same bill twice when making a purchase
    - there is no data table to keep track of the users 'wallet'
    - want to figure out a way to test the make_change function in the purchase model
