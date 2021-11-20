require_relative '../config/environment'
require "artii"
require "colorize"

arter = Artii::Base.new


puts arter.asciify("SeekingAlpha Soda").red

prompt = TTY::Prompt.new
current_user = nil
purchase = nil



# login
    if current_user == nil 
        menu_selections = ['Login', 'New User', 'Exit']

        login = prompt.select("Hello! Please sign in.", menu_selections)
        login == 'Login' ? user = prompt.ask('Please enter your username', required: true) : nil


        if login == 'New User'
                new_user = prompt.ask('Please enter a unique username', required: true)

                # if there is an input and the input is not a duplicate, create the new user
                while User.all.find_by(name: new_user) != nil && new_user do
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
            login = prompt.select("Hmm that user doesn't exist. Please try again or create a new user", menu_selections)
        end 

    end 


#starter menu prompt
    if current_user != nil
        drinks = Drink.all.map {|drink| drink.name}

        menu = prompt.select("Hello #{current_user}! Thank you for choosing SeekingAlpha Soda. Please select an option below.", drinks, 'Exit', required: true)

    end

    menu === 'Exit' || login === 'Exit' ? exit : nil