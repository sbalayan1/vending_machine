require_relative '../config/environment'
require "artii"
require "colorize"

arter = Artii::Base.new


puts arter.asciify("SeekingAlpha Soda").red

prompt = TTY::Prompt.new
current_user = nil
login = nil
change = nil

# login
    while current_user == nil && User.all.find_by(name: current_user) == nil && login != 'Exit' do
        if current_user == nil 
            menu_selections = ['Login', 'New User', 'Exit']

            login = prompt.select("Hello! Please sign in.", menu_selections)
            login == 'Login' ? user = prompt.ask('Please enter your username', required: true) : nil


            if login == 'New User'
                    new_user = prompt.ask('Please enter a unique username', required: true)

                    # if there is an input and the input is not a duplicate, create the new user
                    while User.all.find_by(name: new_user) != nil do
                        puts 'Hmmm seems like that name already exists.'
                        new_user = prompt.ask('Please enter a unique username', required: true)
                    end 

                    if new_user && User.all.find_by(name: new_user) == nil
                        User.create(name: new_user)
                        user = new_user
                    end
            end
            
            if User.all.find_by(name: user)
                current_user = user
            else
                login = prompt.select("Hmm that user doesn't exist. Please try again or create a new user.", menu_selections)
            end 
        end 
    end

#drink menu
    if current_user != nil
        drinks = Drink.all.map {|drink| drink.name}
        drink_menu = nil
        drink = nil
        payment = nil

        while drink_menu == nil && drink_menu != 'Exit' do
            
            drink_menu = prompt.select("Hello #{current_user}! Thank you for choosing SeekingAlpha Soda. Please select an option below.", drinks, 'Exit', required: true)

            drink = Drink.all.find_by(name: drink_menu)

            if drink.quantity <= 0
                drinks = drinks.select {|drink| drink != drink_menu}

                drink_menu = prompt.select("Unfortunately we're sold out of #{drink.name}. Please select another option below.", drinks, required: true)

                drink = Drink.all.find_by(name: drink_menu)
            end       
        end

        payment = prompt.ask("#{drink.name} sounds great! That will be $#{drink.price}. Please enter your desired payment amount!", required: true).to_f

        while payment do
            puts Till.all.map {|t| t.value}
            if payment > 0 && payment >= drink.price
                drink.quantity -= 1
                drink.save
                change = payment - drink.price
                puts "Thank you for your purchase! Here is your #{drink.name} and your change of $#{change}0!"
                payment = nil
            else 
                payment = prompt.ask("Hmmm seems like you entered in the incorrect amount! That will be $#{drink.price}. Please enter your desired payment amount!", required: true).to_f
            end   
        end 
    end

    drink_menu === 'Exit' || login === 'Exit' ? exit : nil