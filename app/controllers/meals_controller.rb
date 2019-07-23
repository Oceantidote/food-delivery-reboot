require_relative '../views/view'
require_relative '../models/meal'
class MealsController

  def initialize(meal_repository)
    @meal_repo = meal_repository
    @view = View.new
  end

  def list
    meals = @meal_repo.all
    @view.display_meals(meals)
  end

  def add
    name = @view.ask("name")
    price = @view.ask("price").to_i
    meal = Meal.new(name: name, price: price)
    @meal_repo.add(meal)
  end

end



