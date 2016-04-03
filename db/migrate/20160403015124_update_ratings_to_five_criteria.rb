class UpdateRatingsToFiveCriteria < ActiveRecord::Migration
  def change # DIRTY BOOOOO BOOOOO
    rename_column :ratings, :value, :value1
    add_column :ratings, :value2, :integer
    add_column :ratings, :value3, :integer
    add_column :ratings, :value4, :integer
    add_column :ratings, :value5, :integer
  end
end
