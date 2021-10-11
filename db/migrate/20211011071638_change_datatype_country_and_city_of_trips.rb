class ChangeDatatypeCountryAndCityOfTrips < ActiveRecord::Migration[5.2]
  def change
    change_column :trips, :country, :string
    change_column :trips, :city, :string
  end
end
