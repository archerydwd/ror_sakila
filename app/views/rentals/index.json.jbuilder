json.array!(@rentals) do |rental|
  json.extract! rental, :id, :rental_date, :inventory_id, :customer_id, :return_date, :staff_id, :last_update
  json.url rental_url(rental, format: :json)
end
