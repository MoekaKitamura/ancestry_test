class AddIndexAncestryToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_index  :places, :ancestry
  end
end
