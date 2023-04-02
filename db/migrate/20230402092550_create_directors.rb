class CreateDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :nationality
      t.string :date_of_birth
      t.string :favorite_genre

      t.timestamps
    end
  end
end
