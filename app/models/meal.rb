class Meal

  attr_reader :price, :name
  attr_accessor :id
  def initialize(attributes = {})
    @name = attributes[:name]
    @price = attributes[:price]
    @id = attributes[:id]
  end


end
