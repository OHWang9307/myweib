Rails.application.routes.draw do
  get 'sessions/new'

     root to: 'static_pages#home'
      get  '/help',    to: 'static_pages#help'
      get  '/about',   to: 'static_pages#about'
      get  '/signup',  to: 'users#new'
      get  '/contact', to: 'static_pages#contact'
      resources :users          # NEW LINE
      resources :microposts, only: [:create, :destroy]     # NEW LINE
 get    '/login',   to: 'sessions#new'
      post   '/login',   to: 'sessions#create'
      delete '/logout',  to: 'sessions#destroy'
end
