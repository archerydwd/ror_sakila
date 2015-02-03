json.array!(@cities) do |city|
  json.extract! city, :id, :city, :country_id, :last_update
  json.url city_url(city, format: :json)
end
