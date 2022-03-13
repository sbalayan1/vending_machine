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
        name = name.to_sym
        @drink_menu[name][:price]
    end

    # takes drink name as an input and returns the drink's quantity
    def check_drink_stock name
    end 

    # takes a coin as an input and return's the coins quantity
    def check_coin_stock coin
    end 

    # purchase a drink
    def purchase_drink
        # Should check to see if the drink is in stock
        # Should reduce the number of drinks in the machine/menu
        # Should adjust till based on payment and change
    end


end 