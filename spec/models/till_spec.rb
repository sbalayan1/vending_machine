require_relative '../spec_helper'

RSpec.describe Till, type: :model do
    let!(:till) { Till.new(value: 10, quantity: 10) }
  
    describe '#value' do
      it 'returns the till value' do
        expect(till.value).to eq(10)
      end
    end
  
    describe '#quantity' do
      it 'returns till quantity' do
        expect(till.quantity).to eq(10)
      end
    end
    
    puts 'Till tests successfully passed'
end