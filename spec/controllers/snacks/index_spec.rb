require 'rails_helper'

RSpec.describe 'Snack Index' do
  before :each do
    stub_body = File.open('spec/fixtures/all_snacks.json')

    stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/snacks")
      .to_return(status: 200, body: stub_body, headers: {})

    visit '/snacks'
  end

  it 'has a list of all snacks' do
    expect(page).to have_content('Funyuns')
    expect(page).to have_content('Honey Bun')
  end
end
