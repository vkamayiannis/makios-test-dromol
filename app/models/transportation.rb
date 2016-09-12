class Transportation < ActiveRecord::Base
  has_many :routes
  has_many :final_routes
end
