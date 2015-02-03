class Staff < ActiveRecord::Base
  belongs_to :address
  belongs_to :store
end
