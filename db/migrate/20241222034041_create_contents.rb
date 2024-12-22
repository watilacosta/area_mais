class CreateContents < ActiveRecord::Migration[8.0]
  def change
    create_table :contents do |t|
      t.string :title, null: false
      t.text :body
      t.integer :content_type
      t.references :exclusive_area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
