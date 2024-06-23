class AddPhoneNumberToDestinations < ActiveRecord::Migration[7.0]
  def change
    add_column :destinations, :phone_number, :string
  end
end
