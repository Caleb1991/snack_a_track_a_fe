require 'rails_helper'

RSpec.describe SnackService do
  describe '#get_all_snacks' do
    it 'returns all snacks' do
      stub_body = File.open('spec/fixtures/all_snacks.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/snacks")
        .to_return(status: 200, body: stub_body, headers: {})

      snacks = SnackService.get_all_snacks

      expect(snacks[:data][:attributes][:snacks][0][:name]).to eq('Funyuns')
    end
  end

  describe '#get_single_snack' do
    it 'returns a snack for given id' do
      stub_body = File.open('spec/fixtures/single_snack.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/snacks/1")
        .to_return(status: 200, body: stub_body, headers: {})

      snack = SnackService.get_single_snack(1)

      expect(snack[:data][:attributes][:name]).to eq('Funyuns')
    end
  end
end
