class CreateFans < ActiveRecord::Migration
  def change
    create_table :fans do |t|
      t.string :name
      t.string :email
      t.integer :location_id

      t.timestamps
    end
  end
end
