class CreateMemberships < ActiveRecord::Migration[8.0]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exclusive_area, null: false, foreign_key: true
      t.integer :payment_status, null: false, default: 0
      t.datetime :expires_at, null: false

      t.timestamps
    end
  end
end
