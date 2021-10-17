require 'rails_helper'

RSpec.describe UserFacade do
  describe '#create_user_objects' do\
    it 'creates user objects of all users' do
      stub_body = File.open('spec/fixtures/all_users.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users")
        .to_return(status: 200, body: stub_body, headers: {})

      users_array = UserFacade.create_user_objects

      expect(users_array).to be_an_instance_of(Array)
      expect(users_array[0]).to be_an_instance_of(User)
      expect(users_array[0].id).to eq(1)
      expect(users_array[0].first_name).to eq('Roald')
      expect(users_array[0].last_name).to eq('Roaldington')
      expect(users_array[0].email).to eq('RoaldRules91@Gmail.Com')
      expect(users_array[0].username).to eq('Roald1991')
    end
  end

  describe '#create_single_user_object' do
    it 'creates a single user object' do
      stub_body = File.open('spec/fixtures/single_user.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/1")
        .to_return(status: 200, body: stub_body, headers: {})

      single_user = UserFacade.create_single_user_object(1)

      expect(single_user).to be_an_instance_of(User)
      expect(single_user.id).to eq(1)
      expect(single_user.first_name).to eq('Roald')
      expect(single_user.last_name).to eq('Roaldington')
      expect(single_user.email).to eq('RoaldRules91@Gmail.Com')
      expect(single_user.username).to eq('Roald1991')
    end
  end

  describe '#login_user' do
    it 'logs a user in' do
      user_parameters = {
        username: 'Gao113211',
        password: 'Password1'
      }

      stub_body = File.open('spec/fixtures/user_login.json')

      stub_request(:post, "https://lit-reaches-91268.herokuapp.com/api/v1/sessions")
        .to_return(status: 200, body: stub_body, headers: {})

      logged_in_user = UserFacade.log_in_user(user_parameters)

      expect(logged_in_user[:logged_in]).to eq(true)
    end
  end

  describe '#register_user' do
    it 'registers a user' do
      user_parameters = {
        username: 'Gao113211',
        first_name: 'Gato',
        email: 'CatsRule1@Gmail.com',
        password: 'test',
        password_confirmation: 'test'
      }

      stub_body = File.open('spec/fixtures/create_user.json')

      stub_request(:post, "https://lit-reaches-91268.herokuapp.com/api/v1/users")
        .to_return(status: 200, body: stub_body, headers: {})

      user = UserFacade.register_user(user_parameters)

      expect(user.username).to eq('Gao113211')
    end

    it 'returns errors' do
      user_parameters = {
        username: 'Gao113211',
        first_name: 'Gato',
        email: 'CatsRule1@Gmail.com',
        password: 'test',
        password_confirmation: 'test'
      }

      stub_body = File.open('spec/fixtures/register_user_errors.json')

      stub_request(:post, "https://lit-reaches-91268.herokuapp.com/api/v1/users")
        .to_return(status: 200, body: stub_body, headers: {})


      user = UserFacade.register_user(user_parameters)

      expect(user).to eq(["Username has already been taken", "Last name can't be blank"])
    end
  end

  describe '#top_snacks' do
    it 'returns  users top rated snacks' do
      stub_body = File.open('spec/fixtures/top_rated_users_snacks.json')

      snacks = UserFacade.top_snacks(1, 5)

      expect(snacks).to be_an(Array)
      expect(snacks.count).to eq(5)
      expet(snacks[0].name).to eq('Cheetos')
      expet(snacks[1].name).to eq('Doritos')
      expet(snacks[2].name).to eq('Honey Bun')
      expet(snacks[3].name).to eq('Star Crunch')
      expet(snacks[4].name).to eq('Funyuns')
    end
  end
end
