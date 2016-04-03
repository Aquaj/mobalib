class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :certification
      t.integer :latitude
      t.integer :longitude

      t.timestamps null: false
    end
  end
end
