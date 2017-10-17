class CreateCabins < ActiveRecord::Migration[5.0]
  def change
    create_table :cabins do |t|
      t.string :name
      t.integer :beds
      t.integer :deck
      t.references :ship, foreign_key: true

      t.timestamps
    end
  end
end
