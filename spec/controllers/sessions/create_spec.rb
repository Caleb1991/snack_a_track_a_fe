require 'rails_helper'

RSpec.describe 'Sessions Controller' do
  describe '#create' do
    it 'logs a user in' do
      stub_body = File.open('spec/fixtures/user_login.json')

      visit '/welcome'

      fill_in :username, with: 'Gao113211'
      fill_in :password, with: 'Password1'

      stub_request(:post, "https://lit-reaches-91268.herokuapp.com/api/v1/sessions")
        .to_return(status: 200, body: stub_body, headers: {})

      click_on 'Login'

      expect(current_path).to eq("/users/4")
    end
  end
end
