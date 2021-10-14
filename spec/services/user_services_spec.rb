require 'rails_helper'

RSpec.describe UserServices do
  describe '#get_all_users' do
    it 'gets all users' do
      # get 'https://lit-reaches-91268.herokuapp.com/api/v1/users'

      all_users = UserServices.get_all_users

      expect(all_users[:data][:attributes][:users]).to eq([])
    end
  end
end
