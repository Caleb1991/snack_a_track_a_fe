require 'rails_helper'

RSpec.describe User do
  before :each do
    user_attributes = {
      id: 1,
      username: 'Roald1122',
      first_name: 'Roald',
      last_name: 'Roaldington',
      email: 'PenguinsRule1@Gmail.Com'
    }

    @user = User.new(user_attributes)
  end

  describe '#initialize' do
    it 'exists' do
      expect(user).to be_an_instance_of(User)
    end

    it 'has attributes' do
      expect(@user.id).to eq(1)
      expect(@user.username).to eq('Roald1122')
      expect(@user.first_name).to eq('Roald')
      expect(@user.last_name).to eq('Roaldington')
      expect(@user.email).to eq('PenguinsRule1@Gmail.Com')
    end
  end
end
