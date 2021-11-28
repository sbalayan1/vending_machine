class Purchase < ActiveRecord::Base
    belongs_to :user
    belongs_to :drink

    def make_change (amount, coins)
        if coins[0].value > coins[coins.length-1].value
            coins = coins.reverse()
        end 
    
        answer = []
        i = coins.length - 1
        j = 0
    
        while i>=0 do
            while amount >= coins[i].value do
                if coins[i].quantity == 0
                    break
                else
                    coins[i].quantity -= 1
                    coins[i].save
                    answer.push(coins[i].value)
                    amount -= coins[i].value
                end
            end 
    
            i-=1
        end 
    
        puts answer
    end 
end 
