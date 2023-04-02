class Movie < ApplicationRecord
    enum status: { draft:0, published:2 }
    validates :name, :release_year, :synopsis, :country_of_origin, :duration, :genre_id, :director_id, :image, presence: true
    belongs_to :genre
    belongs_to :director
    has_one_attached :image
  
    def released?
      release_year <= Date.today.year
    end
  end