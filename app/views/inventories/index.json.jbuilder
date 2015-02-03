json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :film_id, :store_id, :last_update
  json.url inventory_url(inventory, format: :json)
end
