require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'has a form to login' do
    visit '/front_end/v1/welcome'

    expect(page).to have_field(:username)
    expect(page).to have_field(:password)
    expect(page).to have_link('Login')
  end
end
