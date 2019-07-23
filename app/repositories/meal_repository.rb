require_relative "../models/meal"
require 'csv'

class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @next_id = 1
    @meals = []
    load_csv if File.exist?(@csv_file_path)
  end

  def add(meal)
    meal.id = @next_id
    @meals << meal
    save_csv
    @next_id += 1
  end

  def all
    @meals
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << [ "id", "name", "price"]
      @meals.each do |meal|
        csv << [ meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @meals.empty? ? @next_id = 1 : @next_id = @meals.last.id + 1
  end

end


