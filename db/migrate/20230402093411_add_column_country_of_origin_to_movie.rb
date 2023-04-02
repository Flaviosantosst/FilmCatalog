class AddColumnCountryOfOriginToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :country_of_origin, :string
  end
end
