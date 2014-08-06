class AddLocationIdToFan < ActiveRecord::Migration
  def change
    add_column :fans, :location_id, :integer
  end
end
