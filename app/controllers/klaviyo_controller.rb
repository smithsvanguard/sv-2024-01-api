class KlaviyoController < ActionController::API

  def create
    # Path: /klaviyo [POST] This is set by convention of Ruby on Rails.

    # API Endpoint for Klaviyo
    endpoint  = 'https://a.klaviyo.com/api/profiles/'

    # Note: The API key should not be here. It is only for demo purpose
    # It should be place in a secrets/vault.
    api_key   = 'Klaviyo-API-Key pk_bc7c3963abe73e3d041b19e4142629671b'

    # Retrieve the parameters from the request
    email         = params[:email]
    first_name    = params[:first_name]
    last_name     = params[:last_name]
    phone_number  = params[:phone_number]
    date_of_birth = params[:date_of_birth]

    # Create an object that matches the required structure from Klaviyo
    post_data = {
      "data": {
        "type": "profile",
        "attributes": {
          "email"       => email,
          "first_name"  => first_name,
          "last_name"   => last_name,
          "phone_number" => "+" + phone_number,
          "properties": {
            "date_of_birth" => date_of_birth
          }
        }
      }
    }

    # Create the headers, including the API key
    headers = {
      'content-Type'  => 'application/json',
      'accept'        => 'application/json',
      'revision'      => '2023-12-15',
      'Authorization' => api_key
    }

    begin
      # Perform a REST HTTP POST using the rest-client library
      response = RestClient.post(
        endpoint,
        post_data.to_json,
        headers
      )

      # Parse the JSON result
      @api_result = JSON.parse(response.body)

      # Return the JSON result
      render json:@api_result
    rescue RestClient::Conflict => e
      # Return an error if the Klaviyo API checked that the record exists
      render json: { error: 'Record already exists' }, status: :conflict
    rescue RestClient::BadRequest => e
      # Return a generic error for other exceptions
      render json: JSON.parse(e.response.errors), status: :bad_request
    end
  end
end
