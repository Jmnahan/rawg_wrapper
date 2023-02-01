module Rawg
  class Request
    require 'rest_client'

    TOKEN = Rails.application.config.token
    BASE_URL = "https://api.rawg.io/api"

    def self.call (http_method, endpoint)
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}#{endpoint}?key=#{TOKEN}",
        headers: {"Content-Type" => "application/json"}
      )
      {code: result.code, status: "Success", data: JSON.parse(result.body)}
    rescue RestClient::ExceptionWithResponse => error
      {code: error.http_code, status: error.message, data: Errors.map(error.http_code)}
    end
  end
end

