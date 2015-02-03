class Rental < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :customer
  belongs_to :staff
end
