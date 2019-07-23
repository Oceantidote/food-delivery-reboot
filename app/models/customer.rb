class Customer

  attr_reader :address, :name
  attr_accessor :id
  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @id = attributes[:id]
  end


end
