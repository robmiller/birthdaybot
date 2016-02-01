require "delegate"

class EmployeeWithBirthday < SimpleDelegator
  def birthday
    date_of_birth.is_a?(Date) &&
      Date.new(Date.today.year, date_of_birth.month, date_of_birth.day)
  end

  def age
    if date_of_birth.is_a?(Date)
      ((birthday - date_of_birth) / 365).floor
    else
      "Unknown"
    end
  end
end
