class ChangeHandicapToReferenceInUser < ActiveRecord::Migration
  def change
    remove_column :users, :handicap
    add_reference :users, :handicap, index: true, foreign_key: true
  end
end
