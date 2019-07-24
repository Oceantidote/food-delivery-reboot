class Employee

  attr_reader :role, :username, :password
  attr_accessor :id
  def initialize(attributes = {})
    @username = attributes[:username]
    @password = attributes[:password]
    @id = attributes[:id]
    @role = attributes[:role]
  end

  def manager?
    @role == "manager"
  end

  def to_csv_row
    [@id,@username,@password,@role]
  end

  def self.headers
    %w(id username password role)
  end

end
