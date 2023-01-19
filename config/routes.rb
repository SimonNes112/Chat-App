Rails.application.routes.draw do
  #root 
  root 'welcome#index'
  #resources
  resources :posts do
    resources :comments
  end
  resources :users 
  resources :sessions, only: [:new, :create]
  #custom routes
  match 'logout', to: 'sessions#destroy', via: :delete, as: 'logout'
  #routes
end
