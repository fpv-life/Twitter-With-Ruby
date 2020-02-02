Rails.application.routes.draw do
  resources :comments
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :lists
  resources :feeds
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  root to:'feeds#index'
  match '/users',   to: 'users#index',   via: 'get'
  resources :users, :only => [:index, :show] do
    resources :follows, :only => [:create, :destroy]
  end
  resources :feeds do
    member do
      put "like", to: "feeds#upvote"
      put "dislike", to: "feeds#downvote"
      put "report", to: "feeds#report"
      put "pardon", to: "feeds#pardon"
    end
  end
  get 'users/:id' => 'users#show'
end
