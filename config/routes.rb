Rails.application.routes.draw do
  # get 'pages/home'
  devise_for :users
  # get 'page/index'
  root to: 'pages#home'
  resources :manegers
  resources :sites
  resources :notifications
  resources :support
  resources :dashboard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
