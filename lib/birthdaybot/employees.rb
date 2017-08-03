require "json"
require "date"

class Employees
  def initialize(api_key:)
    @api_key = api_key
  end

  def all
    @employees ||=
      begin
        fetch
        parse
      end
  end

  private

  API_URL = "https://api.breathehr.com:443/v1/employees"

  attr_reader :api_key

  def fetch
    request = Typhoeus::Request.new(API_URL,
                                    method: :get,
                                    params: { "page" => 1, "per_page" => 100 },
                                    headers: { "X-API-KEY" => api_key})
    response = request.run
    @json = response.body
  end

  def parse
    data = JSON.parse(@json)
    data["employees"].map do |employee|
      next unless employee["dob"]
      Employee.new(employee["first_name"], employee["last_name"], Date.parse(employee["dob"]))
    end.compact
  end
end

Employee = Struct.new(:first_name, :last_name, :date_of_birth)
