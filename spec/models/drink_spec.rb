# require_relative '../spec_helper'

# RSpec.describe Drink, type: :model do
#     let!(:drink) { Drink.new(name: 'Root Beer', quantity: 10 , price: 2.0) }
  
#     describe '#name' do
#       it 'returns the user name' do
#         expect(drink.name).to eq('Root Beer')
#       end
#     end
  
#     describe '#quantity' do 
#       it 'returns drink quantity' do
#         expect(drink.quantity).to eq(10)
#       end
#     end
  
#     describe '#price' do
#       it 'returns the drink price' do
#         expect(drink.price).to eq(2.0)
#       end
#     end
  
#     puts 'Drink tests successfully passed'
# end

# describe '../../apps/drink' do
#   describe Drink do
#     describe '#initialize' do
#       it 'initializes a drink instance with @name, @price, @quantity' do
#         drink = Drink.new('Coca Cola', 2, 5)
#         expect(drink.instance_variable_get(:@name)).to eq('Coca Cola')
#         expect(drink.instance_variable_get(:@price)).to eq(2)
#         expect(drink.instance_variable_get(:@price)).to eq(5)
#       end 
#     end 
#   end 
# end 