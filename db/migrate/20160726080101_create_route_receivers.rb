class CreateRouteReceivers < ActiveRecord::Migration
  def change
    create_table :route_receivers do |t|
      t.references :route, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
