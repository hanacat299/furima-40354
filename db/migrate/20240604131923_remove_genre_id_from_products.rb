class RemoveGenreIdFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :genre_id, :string
  end
end
