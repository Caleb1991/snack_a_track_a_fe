require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'has a login button' do
    visit root_path

    expect(page).to have_button('Login')
  end
end
