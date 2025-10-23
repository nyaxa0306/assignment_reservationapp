class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :detail
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
