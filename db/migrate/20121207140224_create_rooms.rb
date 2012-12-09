class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :tittle
      t.string :city
      t.string :address
      t.string :rooms
      t.string :text
      t.integer :price
      t.string :pic

      t.timestamps
    end
  end
end

