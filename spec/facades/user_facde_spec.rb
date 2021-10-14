require 'rails_helper'

RSpec.describe UserFacade do
  describe '#create_user_objects' do\
    it 'creates user objects of all users' do
      stub_body = File.open('spec/fixtures/all_users.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users")
        .to_return(status: 200, body: stub_body, headers: {})

      users_array = UserFacade.create_user_objects

      expect(users_array).to be_an_instance_of(Array)
      expect(users_array[0].id).to eq(1)
      expect(users_array[0].first_name).to eq('Roald')
      expect(users_array[0].last_name).to eq('Roaldington')
      expect(users_array[0].email).to eq('RoaldRules91@Gmail.Com')
      expect(users_array[0].username).to eq('Roald1991')
    end
  end
end
