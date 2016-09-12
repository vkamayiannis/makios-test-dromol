class Customer < ActiveRecord::Base
  has_many :routes
  has_many :route_receivers
end
