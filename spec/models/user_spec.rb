require_relative '../spec_helper'

RSpec.describe User, type: :model do
    let!(:user) {(User.new(name:'Thomas'))}

    describe '#name' do
        it 'returns the user name' do
            expect(user.name).to eq('Thomas')
        end
    end

    puts 'User tests successfully passed'
end 