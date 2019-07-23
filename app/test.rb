require_relative "repositories/meal_repository"

repo = MealRepository.new(File.join(__dir__, '../data/meals.csv'))
p repo
