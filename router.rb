# As a user I can list all meals
# As a user I can add a meal
# As a user I can list all customers
# As a user I can add a customer
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      choice = display_menu
      print `clear`
      action(choice)
    end
  end

  def display_menu
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "5 - Quit application"
    gets.chomp.to_i
  end

  def action(choice)
    case choice
    when 1
      @meals_controller.list
    when 2
      @meals_controller.add
    when 3
      @customers_controller.list
    when 4
      @customers_controller.add
    when 5
      @running = false
    else
      puts "Try again..."
    end
  end
end
