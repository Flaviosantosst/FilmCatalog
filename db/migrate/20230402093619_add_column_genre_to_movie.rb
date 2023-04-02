class AddColumnGenreToMovie < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :genre, null: false, foreign_key: true, default: 0
  end
end
