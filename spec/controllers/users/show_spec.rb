require 'rails_helper'

RSpec.describe 'User Show Page' do
  before :each do
    login_stub_body = File.open('spec/fixtures/user_login.json')
    user_page_stub_body = File.open('spec/fixtures/gao113211.json')
    top_snacks_stub_body = File.open('spec/fixtures/top_rated_users_snacks.json')

    visit '/welcome'

    fill_in :username, with: 'Gao113211'
    fill_in :password, with: 'Password1'

    stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/4")
      .to_return(status: 200, body: user_page_stub_body, headers: {})

    stub_request(:post, "https://lit-reaches-91268.herokuapp.com/api/v1/sessions")
      .to_return(status: 200, body: login_stub_body, headers: {})

    stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/4/snacks/users_top_rated_snacks?limit=5")
      .to_return(status: 200, body: top_snacks_stub_body, headers: {})

    click_on 'Login'
  end

  it 'has a users username' do
    expect(current_path).to eq('/users/4')
    expect(page).to have_content("Hope you're hungry, Gao113211!")
  end

  it 'has a users first five top rated snacks' do
    expect(page).to have_content('Cheetos')
    expect(page).to have_content('Doritos')
    expect(page).to have_content('Honey Bun')
    expect(page).to have_content('Star Crunch')
    expect(page).to have_content('Funyuns')
  end

  it 'can log a user out' do
    expect(page).to have_link('Log Out')

    click_on 'Log Out'

    expect(current_path).to eq('/welcome')
  end
end
