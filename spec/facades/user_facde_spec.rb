require 'rails_helper'

RSpec.describe UserFacade do
  describe '#create_user_objects' do\
    it 'creates user objects of all users' do
      stub_body = File.open('spec/fixtures/all_users.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users")
        .to_return(status: 200, body: stub_body, headers: {})

      users_array = UserFacade.create_user_objects

      expect(users_array).to be_an_instance_of(Array)
    end
  end
end
