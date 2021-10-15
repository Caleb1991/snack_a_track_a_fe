require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'has a login button' do
    visit '/front_end/v1/welcome'

    expect(page).to have_link('Login')
  end
end
