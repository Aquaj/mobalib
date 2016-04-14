class AddHandikeyToHandicap < ActiveRecord::Migration
  def change
    add_column :handicaps, :handikey, :string
  end
end
