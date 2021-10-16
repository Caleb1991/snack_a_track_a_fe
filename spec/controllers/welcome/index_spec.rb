require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'has a login link' do
    visit '/front_end/v1/welcome'

    expect(page).to have_link('Login')
  end
end
