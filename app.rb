require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"

meal_csv_path = File.join(__dir__, 'data/meals.csv')
meal_repo = MealRepository.new(meal_csv_path)
meals_controller = MealsController.new(meal_repo)

require_relative "app/repositories/customer_repository"
require_relative "app/controllers/customers_controller"
require_relative "router"
customer_csv_path = File.join(__dir__, 'data/customers.csv')
customer_repo = CustomerRepository.new(customer_csv_path)
customers_controller = CustomersController.new(customer_repo)

require_relative "app/repositories/employee_repository"
require_relative "app/controllers/sessions_controller"

employee_csv_path = File.join(__dir__, 'data/employees.csv')
employee_repo = EmployeeRepository.new(employee_csv_path)
sessions_controller = SessionsController.new(employee_repo)


router = Router.new(meals_controller, customers_controller, sessions_controller)

router.run
