class AddColumnDurationToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :duration, :integer
  end
end
