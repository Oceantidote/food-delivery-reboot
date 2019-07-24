class View

  def display_meals(meals)
    puts "MENU"
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - £#{meal.price}"
    end
    puts "-----"
  end

  def display_customers(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end

  def ask(thing)
    puts "please enter your #{thing}"
    gets.chomp
  end

end
