json.array!(@countries) do |country|
  json.extract! country, :id, :country, :last_update
  json.url country_url(country, format: :json)
end
