class AddFinalRouteToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :final_route, :reference
  end

end
