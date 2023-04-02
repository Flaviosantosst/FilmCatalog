class AddColumnSynopsisToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :synopsis, :string
  end
end
