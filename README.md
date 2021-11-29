**About:** This is a Vending Machine CLI application using only Ruby. 

**Instructions:**
1. In your terminal, run the following commands to create and seed the database
 - rake db:migrate
 - rake db:seed
4. In your terminal, run the following commands to start and exit the application 
 - Start: ruby bin/run.rb 
 - Exit: ctrl + c (note you will have to use this to exit the application if at any point you get stuck and there is no exit selection)

**Core Features:**
    - Login/Sign Up
    - View drink menu
    - View coins in till
    - Purchase drink by selecting payment
    - Error handling when the drink is out of stock or there is not enough change in the till
    - Exit at multiple points within the application
    
**Relationships:**

	User has many purchases
	User has many drinks through purchases

	Purchases belong to user
	Purchases belong to drink

	Drink has many purchases
	Drink has many users through purchases 


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

**Notes:**
