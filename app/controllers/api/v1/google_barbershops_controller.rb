class Api::V1::GoogleBarbershopsController < ApplicationController
  def index
    barbershops = GetGoogleBarbershopListService.new(params[:latitude], params[:longitude]).execute
    render json: barbershops
  end

  def show
    render json: GetGoogleBarbershopDetailsService.new(params[:id]).execute
  end
end
