class AddYelpIdToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :yelp_id, :string
  end
end
