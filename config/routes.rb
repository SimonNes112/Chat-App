Rails.application.routes.draw do
  #root 
  root 'welcome#index'
  #resources
  resources :posts
  resources :users 
  resources :sessions, only: [:new, :create]
  resources :comments
  #custom routes
  match 'logout', to: 'sessions#destroy', via: :delete, as: 'logout'
  #routes
end
