class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|

      t.timestamps
      t.references :user, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
    end
  end
end
