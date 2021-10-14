require 'rails_helper'

RSpec.describe UserFacade do
  describe '#create_user_objects' do\
    it 'creates user objects of all users' do
      stub_body = File.open('spec/fixtures/all_users.json')

      users_array = UserFacade.create_user_objects

      expect(users_array).to be_an_instance_of(Array)
    end
  end
end
