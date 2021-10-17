require 'rails_helper'

RSpec.describe Snack do
  before :each do
    snack_attributes = {
      id: 1,
      name: 'Funyuns',
      description: 'A dip into the lovely world that is onion flavored fun.',
      savory: true,
      sweet: false
    }

    @snack = Snack.new(snack_attributes)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@snack).to be_an_instance_of(Snack)
    end

    it 'has attributes' do
      expect(@snack.id).to eq(1)
      expect(@snack.name).to eq('Funyuns')
      expect(@snack.description).to eq('A dip into the lovely world that is onion flavored fun.')
      expect(@snack.savory).to eq(true)
      expect(@snack.sweet).to eq(false)
    end
  end
end
