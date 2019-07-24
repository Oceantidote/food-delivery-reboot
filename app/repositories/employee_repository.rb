require_relative "../models/employee"
require_relative "base_repository"
require 'csv'

class EmployeeRepository < BaseRepository

  def find_by_username(username)
    @elements.find { |user| user.username == username }
  end

  private

  def build_element(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end

end
