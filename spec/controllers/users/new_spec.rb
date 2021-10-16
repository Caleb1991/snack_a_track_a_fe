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

    fill_in :username, with: 'Luke11'
    fill_in :first_name, with: 'Luke'
    fill_in :last_name, with: 'Lukeington'
    fill_in :email, with: 'Luke@gmail.com'
    fill_in :password, with: 'test'
    fill_in :password_confirmation, with: 'test'

    click_on 'Create User'

    expect(current_path).to eq('/users/11')
  end
end
