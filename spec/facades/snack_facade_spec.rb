require 'rails_helper'

RSpec.describe SnackFacade do
  describe '#create_all_snack_objects' do
    it 'takes all snacks and creates objects' do
      snacks = SnackFacade.create_all_snack_objects

      expect(snacks).to be_an(Array)
      expect(snacks[0]).to be_a(Snack)
    end
  end
end
