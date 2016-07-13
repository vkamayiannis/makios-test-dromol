class AddCreatedToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :created, :integer
  end
end
