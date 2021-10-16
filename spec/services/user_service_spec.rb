require 'rails_helper'

RSpec.describe UserService do
  describe '#get_all_users' do
    it 'gets all users' do
      stub_body = File.open('spec/fixtures/all_users.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users")
         .to_return(status: 200, body: stub_body, headers: {})

      all_users = UserService.get_all_users

      expect(all_users[:data][:attributes][:users][0][:first_name]).to eq('Roald')
    end
  end

  describe '#get_single_user' do
    it 'returns a user with the given ID' do
      stub_body = File.open('spec/fixtures/single_user.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/1")
         .to_return(status: 200, body: stub_body, headers: {})

      single_user = UserService.get_single_user(1)

      expect(single_user[:data][:attributes][:first_name]).to eq('Roald')
    end
  end

  describe '#get_users_snacks' do
    it 'returns all of a given users snacks' do
      stub_body = File.open('spec/fixtures/users_snacks.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/1/snacks")
         .to_return(status: 200, body: stub_body, headers: {})

      snacks = UserService.get_users_snacks(1)

      expect(snacks[:data][:attributes][:snacks][0][:name]).to eq('Funyuns')
    end
  end

  describe '#get_users_top_rated_snacks' do
    it 'returns a given amount of users top rated snacks default 5' do
      stub_body = File.open('spec/fixtures/top_rated_users_snacks.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/1/snacks/users_top_rated_snacks?limit=5")
        .to_return(status: 200, body: stub_body, headers: {})

      top_rated_snacks = UserService.get_users_top_rated_snacks(1)

      expect(top_rated_snacks[:data][:attributes][:snacks][0][:name]).to eq('Cheetos')
    end
  end

  describe '#get_user_snack_recommendations' do
    it 'returns snack recommendations for a given user' do
      stub_body = File.open("spec/fixtures/user_snack_recs.json")

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/1/snacks/snack_recommendations")
        .to_return(status: 200, body: stub_body, headers: {})

      snack_recs = UserService.get_user_snack_recommendations(1)

      expect(snack_recs[:data][:attributes][:snacks][0][:name]).to eq('Broccoli')
    end
  end

  describe '#create_a_user' do
    it 'creates a user' do
      user_params = {
        username: 'Gao113211',
        first_name: 'Gato',
        last_name: 'Gatoington',
        email: 'CatsRule1@Gmail.Com',
        password: 'Password1',
        password_confirmation: 'Password1'
      }

      stub_body = File.open('spec/fixtures/create_user.json')

      stub_request(:post, "https://lit-reaches-91268.herokuapp.com/api/v1/users")
        .to_return(status: 200, body: stub_body, headers: {})

      created_user = UserService.create_user(user_params)

      expect(created_user[:data][:attributes][:username]).to eq('Gao113211')
    end
  end

  describe '#log_user_in' do
    it 'logs a user in' do
      user_params = {
        username: 'Gao113211',
        first_name: 'Gato',
        last_name: 'Gatoington',
        email: 'CatsRule1@Gmail.Com',
        password: 'Password1',
        password_confirmation: 'Password1'
      }

      create_user_stub_body = File.open('spec/fixtures/create_user.json')

      stub_request(:post, "https://lit-reaches-91268.herokuapp.com/api/v1/users")
        .to_return(status: 200, body: create_user_stub_body, headers: {})

      created_user = UserService.create_user(user_params)

      user_credentials = {
        username: 'Gao113211',
        password: 'password1'
      }

      log_in_user_stub_body = File.open('spec/fixtures/user_login.json')

      stub_request(:post, "https://lit-reaches-91268.herokuapp.com/api/v1/sessions")
        .to_return(status: 200, body: log_in_user_stub_body, headers: {})

      user_login = UserService.log_user_in(user_credentials)

      expect(user_login[:data][:attributes][:message]).to eq('You have successfully logged in!')
    end
  end
end
