# As a user I can list all meals
# As a user I can add a meal
# As a user I can list all customers
# As a user I can add a customer
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @user = @sessions_controller.sign_in
      while @user
        if @user.manager?
          choice = manager_display_menu
          print `clear`
          manager_action(choice)
        else
          choice = delivery_display_menu
          print `clear`
          delivery_action(choice)
        end
      end
      print `clear`
    end
  end

  def manager_display_menu
    puts "Manager options"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "5 - Quit application"
    puts "6 - Sign Out"
    gets.chomp.to_i
  end

  def delivery_display_menu
    puts "Delivery options"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "5 - Quit application"
    gets.chomp.to_i
  end

  def manager_action(choice)
    # manager can create an order
    # manager can assign an order to a delivery guy
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
      @user = nil
    when 6
      @user = nil
    else
      puts "Try again..."
    end
  end

  def delivery_action(choice)
    # delivery guy can see all his undelivered orders
    # can mark an order as complete
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
