require 'rails_helper'

RSpec.describe 'Sessions Controller' do
  describe '#create' do
    xit 'logs a user in' do
      visit '/welcome'

      fill_in :username, with: 'Gao113211'
      fill_in :password, with: 'Password1'
      click_on 'Login'

      stub_body = File.open('spec/fixtures/user_login.json')

      stub_request(:post, "https://lit-reaches-91268.herokuapp.com/api/v1/sessions")
        .to_return(status: 200, body: stub_body, headers: {})

      stub_request(:post, "https://lit-reaches-91268.herokuapp.com/api/v1/sessions")
        .to_return(status: 200, body: stub_body, headers: {})

      expect(current_path).to eq("/users/4")
    end
  end
end
