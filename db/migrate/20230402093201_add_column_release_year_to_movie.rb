class AddColumnReleaseYearToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :release_year, :string
  end
end
