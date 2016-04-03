class ChangeLngLatToFloatsInPlaces < ActiveRecord::Migration
  def change
    change_column :places, :latitude, :float
    change_column :places, :longitude, :float
  end
end
