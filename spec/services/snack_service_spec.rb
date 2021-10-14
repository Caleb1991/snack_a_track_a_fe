require 'rails_helper'

RSpec.describe SnackService do
  describe '#get_all_snacks' do
    it 'returns all snacks' do
      stub_body = File.open('spec/fixtures/all_snacks.json')

      snacks = SnackService.get_all_snacks

      expect(snacks[:data][:attributes][:snacks][0][:name]).to eq('Funyuns')
    end
  end
end
