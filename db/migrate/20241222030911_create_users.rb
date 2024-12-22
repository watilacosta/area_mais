class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :role, null: false
      t.references :plan, foreign_key: true, null: true

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
