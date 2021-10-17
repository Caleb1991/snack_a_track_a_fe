require 'rails_helper'

RSpec.describe 'Snack Index' do
  before :each do
    visit '/snacks'
  end

  it 'has a list of all snacks' do
    expect(page).to have_content('Funyuns')
    expect(page).to have_content('Honey Bun')
  end
end
