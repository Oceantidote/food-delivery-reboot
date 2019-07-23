class View

  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - £#{meal.price}"
    end
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
