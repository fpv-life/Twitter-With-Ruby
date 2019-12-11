Rails.application.routes.draw do
  resources :feeds
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root to:'feeds#index'
  match '/users',   to: 'users#index',   via: 'get'
  mount Commontator::Engine => '/commontator'
  
end
