class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :category_id,        null: false
      t.integer :unit_id,            null: false
      t.integer :place_id,           null: false
      t.integer :quantity,           null: false
      t.integer :price
      t.string :item_name,           null: false
      t.string :order_code
      t.string :qr_code
      t.text :comment
      t.date :expiry_date 
      t.references :user,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
