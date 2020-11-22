json.id @barbershop.id
json.lonlat @barbershop.lonlat
json.name @barbershop.name
json.address @barbershop.address
json.google_place_id @barbershop.google_place_id

json.ratings @barbershop.ratings do |rating|
  json.value rating.value
  json.opinion rating.opinion
  json.user_name rating.user_name
  json.date rating.created_at.strftime("%d/%m/%Y")
end

json.ratings_count @barbershop.ratings.size
json.ratings_average @barbershop.ratings_average
