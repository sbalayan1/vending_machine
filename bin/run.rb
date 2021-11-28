require_relative '../config/environment'
require "artii"
require "colorize"

arter = Artii::Base.new
puts arter.asciify("SeekingAlpha Soda").red
prompt = TTY::Prompt.new
current_user = nil
login = nil
change = nil
till_total = Till.all.map {|t| t.value * t.quantity}.sum
till_coins = Till.all.map {|t| t}
wallet_coins = [5, 3, 2, 1, 0.5, 0.25]

# login
    menu_selections = ['Login', 'New User', 'Exit']
    login = prompt.select("Hello! Please sign in.", menu_selections)

    while current_user == nil && User.all.find_by(name: current_user) == nil && login != 'Exit' do
        login == 'Login' ? user = prompt.ask('Please enter your username', required: true) : nil

        if login == 'New User'
            new_user = prompt.ask('Please enter a unique username', required: true)

            while User.all.find_by(name: new_user) != nil do
                puts 'Hmmm seems like that name already exists.'
                new_user = prompt.ask('Please enter a unique username', required: true)
            end 

            if new_user && User.all.find_by(name: new_user) == nil
                User.create(name: new_user)
                user = User.all.find_by(name: new_user).name
            end
        end
        
        if User.all.find_by(name: user)
            current_user = User.all.find_by(name: user)
        elsif login != 'Exit' && User.all.find_by(name: user) == nil
            login = prompt.select("Hmm that user doesn't exist. Please try again or create a new user.", menu_selections)
        end 
    end

#drink menu
    if current_user != nil
        drinks = Drink.all.map {|drink| drink}
        drink_menu = nil
        drink = nil
        payment = nil

        hash = {}
        i = 0
        while i<drinks.length do 
            hash["-> #{drinks[i].name}: $#{drinks[i].price}"] = drinks[i].name
            i+=1
        end

        while drink_menu == nil && drink_menu != 'Exit' do
            
            drink_menu = prompt.select("Hello #{current_user.name}! Thank you for choosing SeekingAlpha Soda. Please select an option below.", hash.keys, 'Till', 'Exit', required: true)

            drink = Drink.all.find_by(name: hash[drink_menu])      
        end
   
        while drink_menu === 'Till' do 
            puts Till.all.map {|coin| "Value: $#{coin.value} Quantity: #{coin.quantity}"}

            drink_menu = prompt.select("Hello #{current_user.name}! Thank you for choosing SeekingAlpha Soda. Please select an option below.", hash.keys, 'Till', 'Exit', required: true)

            drink = Drink.all.find_by(name: hash[drink_menu])  
        end

        while drink do
            if drink.quantity <= 0
                hash = hash.select {|drink| drink != drink_menu}

                drink_menu = prompt.select("Unfortunately we're sold out of #{drink.name}. Please select another option below.", hash.keys, 'Exit', required: true)

                drink = Drink.all.find_by(name: hash[drink_menu])
            else 
                break
            end 
        end 

        if drink_menu != 'Exit' && drink_menu != 'Till'
            payment = prompt.select("#{drink.name} sounds great! That will be $#{drink.price}. Please enter your desired payment amount!", wallet_coins, required: true).to_f
        end

        while payment do
            change = payment - drink.price
            if payment > 0 && payment >= drink.price && change <= till_total
                update_till = Till.all.find_by(value: payment)
                update_till.quantity += 1
                update_till.save

                new_purchase = Purchase.create(drink_id: drink.id, user_id: current_user.id, total: drink.price)
                new_purchase.make_change(change, till_coins)

                drink.quantity -= 1
                drink.save

                puts "Thank you for your purchase! Here is your #{drink.name} and your change of $#{change}0!"
                payment = nil
            else 
                payment = prompt.select("Hmmm seems like you entered in the incorrect amount! That will be $#{drink.price}. Please enter your desired payment amount!", wallet_coins, required: true).to_f
            end   
        end 
    end

    drink_menu === 'Exit' || login === 'Exit' ? exit : nil