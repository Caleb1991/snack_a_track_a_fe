class SnackFacade
  def self.create_all_snack_objects
    snack_attributes = SnackService.get_all_snacks

    snack_attributes[:data][:attributes][:snacks].map do |attributes|
      Snack.new(attributes)
    end
  end
end
