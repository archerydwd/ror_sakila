json.array!(@staffs) do |staff|
  json.extract! staff, :id, :first_name, :last_name, :address_id, :email, :store_id, :active, :username, :password, :last_update
  json.url staff_url(staff, format: :json)
end
