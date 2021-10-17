class Snack
  attr_reader :id,
              :name,
              :description,
              :savory,
              :sweet

  def initialize(snack_attributes)
    @id = snack_attributes[:id]
    @name = snack_attributes[:name]
    @description = snack_attributes[:description]
    @savory = snack_attributes[:savory]
    @sweet = snack_attributes[:sweet]
  end
end
