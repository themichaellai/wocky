Wocky::Application.routes.draw do
  devise_for :users
  
  root to: "StaticPages#home"

end
