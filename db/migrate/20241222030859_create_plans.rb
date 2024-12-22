class CreatePlans < ActiveRecord::Migration[8.0]
  def change
    create_table :plans do |t|
      t.string :name, null: false
      t.integer :member_limit
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
