Kix::Application.routes.draw do
  root to: 'games#new'

  resources :games, only: [:new, :create, :show]
  resources :invitations, only: [:new, :create, :show]
  resources :characters, only: [:new, :create, :show]
end
