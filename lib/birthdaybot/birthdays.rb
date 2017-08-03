require "pathname"

require_relative "employee-with-birthday"

class Birthdays
  def initialize(employees:, excludes: [])
    @all_employees = employees
    @excludes      = excludes
  end

  def employees
    all_employees
      .reject { |e| excludes.include?("#{e.first_name} #{e.last_name}") }
      .map { |e| EmployeeWithBirthday.new(e) }
  end

  def without_birthdays
    employees.reject { |e| e.date_of_birth.is_a?(Date) }
  end

  def with_birthdays
    employees.select { |e| e.date_of_birth.is_a?(Date) }
  end

  def upcoming
    with_birthdays.select do |e|
      e.birthday > Date.today && e.birthday - 10 < Date.today
    end.sort_by(&:birthday)
  end

  def today
    with_birthdays.select do |e|
      e.birthday == Date.today
    end
  end

  private
  attr_reader :api, :all_employees, :excludes
end
