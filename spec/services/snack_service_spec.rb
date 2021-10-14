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

  describe '#get_all_savory_or_sweet_snacks' do
    it 'returns all savory snacks' do
      stub_body = File.open('spec/fixtures/savory_snacks.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/snacks/get_all_savory_or_sweet_snacks?limit=5&taste=savory")
        .to_return(status: 200, body: stub_body, headers: {})

      savory_snacks = SnackService.get_all_savory_or_sweet_snacks('savory')

      expect(savory_snacks[:data][:attributes][:snacks][0][:name]).to eq('Funyuns')
    end

    it 'returns all sweet snacks' do
      stub_body = File.open('spec/fixtures/sweet_snacks.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/snacks/get_all_savory_or_sweet_snacks?limit=5&taste=sweet")
        .to_return(status: 200, body: stub_body, headers: {})

      sweet_snacks = SnackService.get_all_savory_or_sweet_snacks('sweet')

      expect(sweet_snacks[:data][:attributes][:snacks][0][:name]).to eq('Star Crunch')
    end
  end

  describe '#average_rating' do
    it 'returns the average rating for a given snack' do
      stub_body = File.open('spec/fixtures/average_rating_for_snack.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/snacks/1/average_rating")
        .to_return(status: 200, body: stub_body, headers: {})

      average_rating = SnackService.average_rating(1)

      expect(average_rating[:data][:attributes][:average_rating]).to eq(2.76666666666667)
    end
  end

  describe '#top_rated_snacks_overall' do
    it 'returns the top rated snacks overall' do
      stub_body = File.open('spec/fixtures/top_rated_snacks_overall.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/snacks/top_rated_snacks_overall?limit=5")
        .to_return(status: 200, body: stub_body, headers: {})


      top_rated_snacks = SnackService.top_rated_snacks_overall

      expect(top_rated_snacks[:data][:attributes][:top_rated_snacks][0][:name]).to eq('Cheetos')
    end
  end

  describe '#top_rated_savory_or_sweet_snacks' do
    it 'returns the top rated savory snacks' do
      stub_body = File.open('spec/fixtures/top_rated_savory_snacks.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/snacks/top_rated_savory_or_sweet_snacks?limit=5&taste=savory")
        .to_return(status: 200, body: stub_body, headers: {})

      top_rated_savory_snacks = SnackService.top_rated_savory_or_sweet_snacks('savory')

      expect(top_rated_savory_snacks[:data][:attributes][:snacks][0][:name]).to eq('Cheetos')
    end

    it 'returns the top rated sweet snacks' do
      stub_body = File.open('spec/fixtures/top_rated_sweet_snacks.json')

      stub_request(:get, "https://lit-reaches-91268.herokuapp.com/api/v1/snacks/top_rated_savory_or_sweet_snacks?limit=5&taste=sweet")
        .to_return(status: 200, body: stub_body, headers: {})

      top_rated_sweet_snacks = SnackService.top_rated_savory_or_sweet_snacks('sweet')

      expect(top_rated_sweet_snacks[:data][:attributes][:snacks][0][:name]).to eq('Honey Bun')
    end
  end
end
