class Drink < ActiveRecord::Base
    has_many :purchases
    has_many :users, through: :purchases

    def initialize name, price, quantity
        @name = name
        @price = price
        @quantity = quantity
    end 
end 