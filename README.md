# [Rawg](https://rawg.io/) Api wrapper

Api-wrapper activity for Avion School

## Ruby version

* Ruby 3.1.2

## System dependencies

 * rest-client 1.8.0
 * dotenv-rails 2.1.1

## Sample Usage

client.rb will be the one responsible on calling and passing http_method and endpoints to request.rb

```ruby
module Rawg
  class Client
    def self.creator_roles
      response = Request.call('get', '/creator-roles')
    end
  end
end
```

controller.rb
```ruby
module Api
  class CreatorRolesController < ApplicationController
    def index
      creator_roles = Rawg::Client.creator_roles
      render json: creator_roles
    end
  end
end
```

routes.rb
```ruby
Rails.application.routes.draw do
  namespace :api do
    get '/creator-roles', to: 'creator_roles#index'
  end
end
```

request.rb will then send a request to the Third party API and upon receiving a response it will be parsed into JSON
```ruby
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
```

if the response reach an error it will be handled by error.rb and return an error message depending on the error code otherwise it will return a reponse code 200, which is a success response.
```ruby
module Rawg
  class Errors
    def self.map(code)
      case code 
      when 401
        return 'Unauthorized request. Please try again!'
      when 404
        return 'Invalid Request!'
      else
        return 'Service Unavailable. Please try again!'
      end
    end
  end
end
```

## Sample success response
```ruby
{
  "code": 200,
  "status": "Success",
  "data": {
    "count": 7,
    "next": null,
    "previous": null,
    "results": [
      {
        "id": 1,
        "name": "writer",
        "slug": "writer"
      }
```
## License

[MIT](https://choosealicense.com/licenses/mit/)