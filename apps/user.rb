class User < ActiveRecord::Base
    has_many :purchases
    has_many :drinks, through: :purchases
end 