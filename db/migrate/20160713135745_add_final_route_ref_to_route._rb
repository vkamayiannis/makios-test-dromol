class AddFinalRouteRefToRoute < ActiveRecord::Migration
  def change
    add_reference :routes, :final_route, index: true, foreign_key: true
  end
end
