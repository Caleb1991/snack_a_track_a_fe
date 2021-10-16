require 'rails_helper'

RSpec.describe 'Welcome register page' do
  it 'has a form to register' do
    visit '/welcome'

    click_on 'Register'

    expect(current_path).to eq('/users/new')

    expect(page).to have_field(:username)
    expect(page).to have_field(:first_name)
    expect(page).to have_field(:last_name)
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_field(:password_confirmation)
  end

  it 'creates a user' do
    visit '/welcome'

    click_on 'Register'

    fill_in :username, with: 'Lando11'
    fill_in :first_name, with: 'Lando'
    fill_in :last_name, with: 'Landoington'
    fill_in :email, with: 'Lando1@gmail.com'
    fill_in :password, with: 'test'
    fill_in :password_confirmation, with: 'test'

    create_stub_body = File.open('spec/fixtures/second_created_user.json')
    user_page_stub_body = File.open('spec/fixtures/lando11.json')

    stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/users/14")
      .to_return(status: 200, body: user_page_stub_body, headers: {})

    stub_request(:post, "https://lit-reaches-91268.herokuapp.com/api/v1/users")
      .to_return(status: 200, body: create_stub_body, headers: {})

    click_on 'Create User'

    expect(current_path).to eq('/users/14')
  end
end
