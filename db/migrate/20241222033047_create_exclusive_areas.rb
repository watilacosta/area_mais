class CreateExclusiveAreas < ActiveRecord::Migration[8.0]
  def change
    create_table :exclusive_areas do |t|
      t.string :name, null: false
      t.text :description
      t.references :owner_id, null: false, foreign_key: { to_table: :users }
      t.integer :member_limit
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
