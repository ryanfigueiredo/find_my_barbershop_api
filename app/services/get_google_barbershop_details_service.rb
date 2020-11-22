require 'rest-client'
require 'json'

class GetGoogleBarbershopDetailsService
  def initialize(google_place_id)
    @google_place_id = google_place_id
  end

  def execute
    begin
      query_params_key = "key=#{Rails.application.credentials.google_secret_key}"
      base_url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{@google_place_id}&#{query_params_key}"
      response = RestClient.get base_url
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => exception
      exception.response
    end
  end
end
