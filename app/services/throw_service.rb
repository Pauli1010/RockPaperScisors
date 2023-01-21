# frozen_string_literal: true

require "http"
require 'rest-client'

class ThrowService
  # Public method
  # Initiates request for the throw.
  # Returns response body if response was valid or nil
  def call
    throw_request_value

    valid_throw_response? ? body : nil
  end

  attr_reader :body, :status_code

  private

  # Private method validating if status code was set to 200
  # and body if the response is within range
  def valid_throw_response?
    return false unless status_code == 200

    %w(rock paper scissors).include? body
  end

  # Private method retrieving data from server and parses it to a hash:
  #  - { "statusCode": 200, "body": "rock" }
  # or when error is thrown, an empty Hash is created.
  # Method sets status code variable to 200 if request fas success and 500 if error was returned.
  # For successful request aso body variable is set with the body of the response.
  #
  # Returns nothing
  def throw_request_value
    # response = HTTP.get(
    #   ENV.fetch('RPC_MOCK_SERVER_URL')
    # )

    response = Rails.env.production? ?
                 RestClient.get(ENV.fetch('RPC_PROD_SERVER_URL')) :
                 RestClient.get(ENV.fetch('RPC_MOCK_SERVER_URL'))

    parsed_response = JSON.parse(response)
    @body = parsed_response["body"]
    @status_code = parsed_response["statusCode"]

  rescue RestClient::InternalServerError
    @status_code = 500
    return
  end
end