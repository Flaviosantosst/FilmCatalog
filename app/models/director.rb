class Director < ApplicationRecord
    validates :name, :nationality, :date_of_birth, :favorite_genre, presence: true
    has_many :movies
  end
