Rails.application.routes.draw do
  root 'static#index'
  namespace :api do
    namespace :v1 do
      resources :users #only: %i[create index]
      resources :businesses
      resources :reviews
      #resources :orders
      post '/login', to: 'users#login'
      get '/auto_login', to: 'users#auto_login'
      get '/search', to: 'businesses#search'
    end
  end
end