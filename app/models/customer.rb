class Customer < ActiveRecord::Base
  belongs_to :store
  belongs_to :address
end
