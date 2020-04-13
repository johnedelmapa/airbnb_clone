class AddActiveToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :is_active, :boolean,default: false
  end
end
