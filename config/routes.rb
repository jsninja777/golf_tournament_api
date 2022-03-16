Rails.application.routes.draw do
  resources :players
  resources :tournaments do
    post 'add/:player_id', to: 'tournaments#add_player', as: :add_player
    delete 'remove/:player_id', to: 'tournaments#remove_player', as: :remove_player
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
