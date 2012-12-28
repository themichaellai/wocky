Wocky::Application.routes.draw do
  get "search/track"

  get "search/artist"

  devise_for :users
  resources :users
  
  root to: "StaticPages#home"

end
