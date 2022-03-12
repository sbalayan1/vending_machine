require_relative '../apps/vending_machine.rb'

describe './apps/vending_machine.rb' do
    describe VendingMachine do
        describe '#initialize' do
            it 'assigns an instance variable @drink_menu to an array with drink names' do
                vm = VendingMachine.new
                expect(vm.instance_variable_get(:@drink_menu)).to eq({
                        CocaCola: {price: 1, quantity: 10}, 
                        Pepsi: {price: 1.25, quantity: 10},
                        RootBeer: {price: 1.5, quantity: 10},
                        Sprite: {price: 1.75, quantity: 10}
                    }
                )

                expect(vm.instance_variable_get(:@till)).to eq({'$5': 5, '$4': 5, '$3': 5, '$2': 5, '$1': 5})
            end 
        end

        describe 'drink_menu' do
            it 'returns the names of all drinks available as an array' do
                vm = VendingMachine.new
                expect(vm.get_drink_menu).to eq({
                        CocaCola: {price: 1, quantity: 10}, 
                        Pepsi: {price: 1.25, quantity: 10},
                        RootBeer: {price: 1.5, quantity: 10},
                        Sprite: {price: 1.75, quantity: 10}
                    }
                )
            end 
        end

        describe 'till' do
            it 'returns a hash with coin values and their quantity in the till' do
                vm = VendingMachine.new
                expect(vm.till).to eq({'$5': 5, '$4': 5, '$3': 5, '$2': 5, '$1': 5})
            end 
        end

        describe 'get_drink_price' do
            it 'takes a drink name as an argument and returns the drinks price' do
                vm = VendingMachine.new
                drink = 'Pepsi'
                expect(vm.get_drink_price(drink)).to be_an(Float)
                expect(vm.get_drink_price(drink)).to eq(1.25)

                # drink = pepsi
                # expect(vm.get_drink_price(drink)).to be_an(Float)
                # expect(vm.get_drink_price(drink)).to eq(1.25)

                # drink = 1
                # expect(vm.get_drink_price(drink)).to raise_error(ArgumentError)
            end 
        end 
    end
end 