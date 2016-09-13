class Customer < ActiveRecord::Base
  self.table_name = 'customer'
  has_many :routes
  has_many :route_receivers
end
