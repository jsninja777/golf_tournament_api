json.extract! tournament, :id, :name, :course, :start_date, :created_at, :updated_at
json.players tournament.players
json.url tournament_url(tournament, format: :json)
