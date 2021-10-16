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
end
