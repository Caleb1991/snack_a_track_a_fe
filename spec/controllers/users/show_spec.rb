require 'rails_helper'

RSpec.describe 'User Show Page' do
  before :each do
    login_stub_body = File.open('spec/fixtures/user_login.json')
    user_page_stub_body = File.open('spec/fixtures/gao113211.json')

    visit '/welcome'

    fill_in :username, with: 'Gao113211'
    fill_in :password, with: 'Password1'

    stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/4")
      .to_return(status: 200, body: user_page_stub_body, headers: {})

    stub_request(:post, "https://lit-reaches-91268.herokuapp.com/api/v1/sessions")
      .to_return(status: 200, body: login_stub_body, headers: {})

    click_on 'Login'
  end

  it 'has a users username' do
    expect(current_path).to eq('/users/4')
    expect(page).to have_content('Welcome, Gao113211!')
  end
end