class AddLoatingTimeToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :loading_time, :time
  end
end
