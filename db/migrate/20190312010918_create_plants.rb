class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
