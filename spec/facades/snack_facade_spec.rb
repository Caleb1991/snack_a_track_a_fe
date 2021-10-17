require 'rails_helper'

RSpec.describe SnackFacade do
  describe '#create_all_snack_objects' do
    before :each do
      stub_body = File.open('spec/fixtures/all_snacks.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/snacks")
        .to_return(status: 200, body: stub_body, headers: {})
    end
    it 'takes all snacks and creates objects' do
      snacks = SnackFacade.create_all_snack_objects

      expect(snacks).to be_an(Array)
      expect(snacks[0]).to be_a(Snack)
    end
  end
end
