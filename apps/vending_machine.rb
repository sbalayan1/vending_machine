require_relative '/apps/drink.rb'

class VendingMachine

    # 
    def initialize
        @drink_menu =  ['Coca Cola', 'Fanta', 'Pepsi', 'Sprite', 'Root Beer']
    end

    # Looks at all drinks available
    def drink_menu 
        @drink_menu
    end
end 