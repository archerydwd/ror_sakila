json.array!(@stores) do |store|
  json.extract! store, :id, :manager_staff_id, :address_id, :last_update
  json.url store_url(store, format: :json)
end
