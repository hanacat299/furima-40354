class RemoveBulidingNameFromDestinations < ActiveRecord::Migration[7.0]
  def change
    remove_column :destinations, :buliding_name, :string
  end
end
