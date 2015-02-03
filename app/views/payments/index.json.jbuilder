json.array!(@payments) do |payment|
  json.extract! payment, :id, :customer_id, :staff_id, :rental_id, :amount, :payment_date, :last_update
  json.url payment_url(payment, format: :json)
end
