json.array!(@customers) do |customer|
  json.extract! customer, :id, :store_id, :first_name, :last_name, :email, :address_id, :active, :create_date, :last_update
  json.url customer_url(customer, format: :json)
end
