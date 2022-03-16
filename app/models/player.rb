class Player < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true

  has_many :tournament_players, dependent:  :destroy
end
