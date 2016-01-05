require "pathname"

class Birthdays
  def initialize(employees:)
    @all_employees = employees
  end

  def employees
    all_employees
      .reject { |e| excludes.include?("#{e.first_name} #{e.last_name}") }
      .each do |e|
        def e.birthday
          date_of_birth.is_a?(Date) &&
            Date.new(Date.today.year, date_of_birth.month, date_of_birth.day)
        end

        def e.age
          if date_of_birth.is_a?(Date)
            ((birthday - date_of_birth) / 365).floor
          else
            "Unknown"
          end
        end
      end
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
  attr_reader :api, :all_employees

  def excludes
    @excludes ||=
      File.read(excludes_file).split("\n").map(&:chomp)
  end

  def excludes_file
    Pathname(__dir__) + ".." + "excludes"
  end
end
