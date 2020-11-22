json.array! @barbershops do |barbershop|
  json.id barbershop.id
  json.lonlat barbershop.lonlat
  json.name barbershop.name
  json.address barbershop.address
  json.google_place_id barbershop.google_place_id

  json.ratings_count barbershop.ratings.size
  json.ratings_average barbershop.ratings_average
end
