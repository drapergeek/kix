Kix::Application.routes.draw do
  resources :games, only: [:new, :create, :show]
  root to: 'games#new'
end
