class AddTransportationToRoute < ActiveRecord::Migration
  def change
    add_reference :routes, :transportation, index: true, foreign_key: true
  end
end
