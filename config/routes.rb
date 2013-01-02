Wocky::Application.routes.draw do
  get "search/track"

  get "search/artist"

  devise_for :users
  resources :users do
    resources :tracks
  end

  resources :tracks do
    resources :votes
  end
  
  #post 'tracks/create' 

  root to: "StaticPages#home"

end
