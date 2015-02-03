json.array!(@addresses) do |address|
  json.extract! address, :id, :address, :district, :city_id, :postal_code, :phone, :last_update
  json.url address_url(address, format: :json)
end
