class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :has_good_credit
      t.boolean :paid

      t.timestamps
    end
  end
end
