class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|

      t.timestamps
      t.string :postal_code,    null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :street_address, null: false
      t.string :buliding_name
      t.references :order,     null: false, foreign_key: true
    end
  end
end
