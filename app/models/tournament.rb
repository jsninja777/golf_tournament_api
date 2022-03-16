class Tournament < ApplicationRecord
  validates :name, presence: true
  validates :course, presence: true
  validates :start_date, presence: true

  has_many :tournament_players
  has_many :players, through: :tournament_players

  def add(player)
    touranment_player = tournament_players.find_or_initialize_by(player_id: player.id)
    touranment_player.save! unless touranment_player.persisted?
  end
  

  def remove(player)
    tournament_players.where(player_id: player.id).destroy_all
  end
end
