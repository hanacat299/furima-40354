class AddBuildingNameToDestinations < ActiveRecord::Migration[7.0]
  def change
    add_column :destinations, :building_name, :string
  end
end
