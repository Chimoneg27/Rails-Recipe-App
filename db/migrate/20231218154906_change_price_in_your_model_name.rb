class ChangePriceInYourModelName < ActiveRecord::Migration[7.1]
  def change
    change_column :foods, :measurement_unit, :string
    change_column :foods, :price, :float
  end
end
