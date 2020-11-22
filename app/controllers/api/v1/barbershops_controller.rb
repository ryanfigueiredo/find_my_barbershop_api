class Api::V1::BarbershopsController < ApplicationController
  before_action :set_barbershop, only: :show

  def show; end

  def index
    @barbershops = Barbershop.within(params[:longitude].to_f, params[:latitude].to_f)
    barbershops_sort_by_ratings_average
  end

  private

  def barbershops_sort_by_ratings_average
    @barbershops.sort_by{ |barbershop| barbershop.ratings_average }.reverse
  end

  def set_barbershop
    @barbershop = Barbershop.find_by!(google_place_id: params[:id])
  end
end
