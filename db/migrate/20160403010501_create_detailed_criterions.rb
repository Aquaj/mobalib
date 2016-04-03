class CreateDetailedCriterions < ActiveRecord::Migration
  def change
    create_table :detailed_criterions do |t|
      t.references :criterion, index: true, foreign_key: true
      t.references :handicap, index: true, foreign_key: true
      t.text :tooltip

      t.timestamps null: false
    end
  end
end
