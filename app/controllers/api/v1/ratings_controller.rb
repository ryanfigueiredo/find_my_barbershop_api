class Api::V1::RatingsController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      create_barbershop
      create_rating

      render json: @rating
    end
  end

  private

  def create_rating
    @rating = Rating.new(ratings_params)

    @rating.barbershop_id = @barbershop.id
    @rating.save!
  end

  def create_barbershop
    @barbershop = Barbershop.find_or_create_by!(
      lonlat: "POINT(#{params[:barbershop][:longitute].to_f} #{params[:barbershop][:latitude].to_f})",
      name: params[:barbershop][:name],
      address: params[:barbershop][:address],
      google_place_id: params[:barbershop][:google_place_id]
    )
  end

  def ratings_params
    params.require(:rating).permit(:value, :opinion, :user_name)
  end
end
