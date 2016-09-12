class AddStatusToFinalRoute < ActiveRecord::Migration
  def change
    add_column :final_routes, :webstatus, :integer
  end
end
