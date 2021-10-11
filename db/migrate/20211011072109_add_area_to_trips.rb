class AddAreaToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :area, :string
  end
end
