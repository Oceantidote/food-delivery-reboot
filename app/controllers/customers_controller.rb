require_relative '../views/view'
require_relative '../models/customer'
class CustomersController

  def initialize(customer_repository)
    @customer_repo = customer_repository
    @view = View.new
  end

  def list
    customers = @customer_repo.all
    @view.display_customers(customers)
  end

  def add
    name = @view.ask("name")
    address = @view.ask("address")
    customer = Customer.new(name: name, address: address)
    @customer_repo.add(customer)
  end

end
