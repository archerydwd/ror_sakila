class Payment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :staff
  belongs_to :rental
end
