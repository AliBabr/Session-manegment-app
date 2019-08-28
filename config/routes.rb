Rails.application.routes.draw do
devise_for :users
devise_scope :user do
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
    get '/maneger/new', :to => 'maneger#new'
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
  # get 'page/index'
  # root to: 'pages#home'
  resources :manegers
  resources :sites do
    collection do
      get :new_site_bY_map
    end
  end
  resources :notifications
  resources :support
  resources :dashboard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
