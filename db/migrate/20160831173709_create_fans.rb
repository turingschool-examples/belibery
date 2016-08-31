class CreateFans < ActiveRecord::Migration
  def change
    create_table :fans do |t|
      t.string :name
      t.string :email
      t.references :location

      t.timestamps
    end
  end
end
