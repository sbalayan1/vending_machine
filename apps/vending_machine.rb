require 'pry'

class VendingMachine
    # attr_accessor :drink_menu, :till

    def initialize
        @drink_menu =  {
            CocaCola: {price: 1, quantity: 10}, 
            Pepsi: {price: 1.25, quantity: 10},
            RootBeer: {price: 1.5, quantity: 10},
            Sprite: {price: 1.75, quantity: 10}
        }

        @till = {'$5': 5, '$4': 5, '$3': 5, '$2': 5, '$1': 5}
    end

    # Looks at all drinks available
    def get_drink_menu
        @drink_menu
    end

    # Looks at all coins in the till
    def till
        @till
    end 

    # Takes a drink name as an input and returns the drink's price
    def get_drink_price name
        # binding.pry
        # drink_names = @drink_menu.keys
        # puts "Select a drink from the list below #{drink_names}"
        # user_input = gets.chomp
        
        if name.class == String
            name = name.to_sym
        end 
        @drink_menu[name][:price]
    end 
end 