require_relative '../apps/vending_machine.rb'

describe './apps/vending_machine.rb' do
    describe VendingMachine do
        describe '#initialize' do
            it 'assigns an instance variable @drink_menu to an array with drink names' do
                vm = VendingMachine.new
                expect(vm.instance_variable_get(:@drink_menu)).to eq(
                    ['Coca Cola', 'Fanta', 'Pepsi', 'Sprite', 'Root Beer']
                )
            end 
        end

        describe 'drink_menu' do
            it 'returns the names of all drinks available as an array' do
                vm = VendingMachine.new
                expect(vm.drink_menu).to eq(
                    ['Coca Cola', 'Fanta', 'Pepsi', 'Sprite', 'Root Beer']
                )
            end 
        end 
    end
end 