class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :room_id
      t.integer :reservation_id
      t.integer :guest_id
      t.integer :host_id
      t.integer :star, default: 1
      t.text :comment
      t.string :type

      t.timestamps
    end
  end
end
