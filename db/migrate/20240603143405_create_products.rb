class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :user,          null: false, foreign_key: true
      t.string :product_name,      null: false
      t.text :explanation,         null: false
      t.integer :price,            null: false
      t.integer :genre_id,         null: false
      t.integer :condition_id,     null: false
      t.integer :shipping_cost_id, null: false
      t.integer :prefecture_id ,   null: false
      t.integer :shipping_day_id,  null: false

      t.timestamps
    end
  end
end
