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

      expect(single_user[:data][:attributes][:first_name]).to eq('Roald')
    end
  end

  describe '#get_users_snacks' do
    it 'returns all of a given users snacks' do
      stub_body = File.open('spec/fixtures/users_snacks.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/1/snacks")
         .to_return(status: 200, body: stub_body, headers: {})

      snacks = UserServices.get_users_snacks(1)

      expect(snacks[:data][:attributes][:snacks][0][:name]).to eq('Funyuns')
    end
  end

  describe '#get_users_top_rated_snacks' do
    it 'returns a given amount of users top rated snacks default 5' do
      stub_body = File.open('spec/fixtures/top_rated_users_snacks.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/1/snacks/users_top_rated_snacks?limit=5")
        .to_return(status: 200, body: stub_body, headers: {})

      top_rated_snacks = UserServices.get_users_top_rated_snacks(1)

      expect(top_rated_snacks[:data][:attributes][:snacks][0][:name]).to eq('Cheetos')
    end
  end

  describe '#get_user_snack_recommendations' do
    it 'returns snack recommendations for a given user' do
      stub_body = File.open("spec/fixtures/user_snack_recs.json")

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/1/snacks/snack_recommendations")
        .to_return(status: 200, body: stub_body, headers: {})

      snack_recs = UserServices.get_user_snack_recommendations(1)

      expect(snack_recs[:data][:attributes][:snacks][0][:name]).to eq('Broccoli')
    end
  end
end
