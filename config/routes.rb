Wocky::Application.routes.draw do

  devise_for :users
  resources :users do
    resources :tracks
    match 'playlist' => 'users#playlist'
  end

  resources :tracks do
    resources :votes
  end
  
  #post 'tracks/create' 

  root to: "StaticPages#home"

end
