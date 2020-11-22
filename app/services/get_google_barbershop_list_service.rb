require 'rest-client'
require 'json'

class GetGoogleBarbershopListService
  def initialize(latitude, longitute)
    @latitude = latitude
    @longitute = longitute
  end

  def execute
    begin
      response = RestClient.get set_base_url
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => exception
      exception.response
    end
  end

  private

  def set_base_url
    base_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?"
    query_params_location = "location=#{@latitude},#{@longitute}&radius=5000"
    query_params_key = "key=#{Rails.application.credentials.google_secret_key}"
    query_params_url = "query=barbershop&#{query_params_location}&#{query_params_key}"
    base_url + query_params_url
  end
end
