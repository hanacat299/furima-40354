class AddGenreIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :genre_id, :string
  end
end
