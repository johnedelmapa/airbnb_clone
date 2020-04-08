class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :home_type
      t.string :room_type
      t.integer :accommodate
      t.integer :bedroom
      t.integer :bathroom
      t.integer :price
      t.string :listing_name
      t.text :summary
      t.boolean :is_tv
      t.boolean :is_kitchen
      t.boolean :is_internet
      t.boolean :is_heating
      t.boolean :is_air
      t.string :address

      t.timestamps
    end
  end
end
