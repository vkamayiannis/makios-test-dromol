class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :customer, index: true, foreign_key: true
      t.string :route_desc
      t.date :route_date
      t.integer :quantity
      t.float :sales_value
      t.float :purchases_value

      t.timestamps null: false
    end
  end
end
