class Transportation < ActiveRecord::Base
  self.table_name = 'transportation'
  self.primary_key = 'CODEID'
  has_many :routes
  has_many :final_routes
end
