class SnacksController < ApplicationController
  def index
    @snacks = SnackFacade.create_all_snack_objects
  end
end
