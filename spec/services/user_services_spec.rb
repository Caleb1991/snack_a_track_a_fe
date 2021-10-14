require 'rails_helper'

RSpec.describe UserServices do
  describe '#get_all_users' do
    it 'gets all users' do
      stub_body = File.open('spec/fixtures/all_users.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users")
         .to_return(status: 200, body: stub_body, headers: {})

      all_users = UserServices.get_all_users

      expect(all_users[:data][:attributes][:users][0][:first_name]).to eq('Roald')
    end
  end

  describe '#get_single_user' do
    it 'returns a user with the given ID' do
      stub_body = File.open('spec/fixtures/single_user.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/1")
         .to_return(status: 200, body: stub_body, headers: {})

      single_user = UserServices.get_single_user(1)

      expect(single_user[:data][:attributes][:user][:name]).to eq('Roald')
    end
  end
end
