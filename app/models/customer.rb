class Customer

  attr_reader :address, :name
  attr_accessor :id
  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @id = attributes[:id]
  end

  def to_csv_row
    [@id,@name,@address]
  end

  def self.headers
    %w(id name address)
  end

end
