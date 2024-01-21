class KlaviyoController < ActionController::API

  def create
    endpoint  = 'https://a.klaviyo.com/api/profiles/'

    # Note: The API key should not be here. It is only for development purpose
    # It should be place in a secrets/vault.
    api_key   = 'Klaviyo-API-Key pk_bc7c3963abe73e3d041b19e4142629671b'

    email         = params[:email]
    first_name    = params[:first_name]
    last_name     = params[:last_name]
    phone_number  = params[:phone_number]
    date_of_birth = params[:date_of_birth]


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

    headers = {
      'content-Type'  => 'application/json',
      'accept'        => 'application/json',
      'revision'      => '2023-12-15',
      'Authorization' => api_key
    }

    begin
      response = RestClient.post(
        endpoint,
        post_data.to_json,
        headers
      )

      @api_result = JSON.parse(response.body)

      render json:@api_result
    rescue RestClient::Conflict => e
      render json: { error: 'Record already exists' }, status: :conflict
    end
  end
end
