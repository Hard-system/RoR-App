class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.string :card_number
      t.references :customer, foreign_key: true
      t.references :reservation, foreign_key: true

      t.timestamps
    end
  end
end
