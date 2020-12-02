class AddCityToCostumes < ActiveRecord::Migration[6.0]
  def change
    add_column :costumes, :city, :string
  end
end
