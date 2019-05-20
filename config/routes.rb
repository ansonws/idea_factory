Rails.application.routes.draw do
  get '/', { to: 'ideas#index', as: 'root' }

  get '/signup', to: "users#new"
  post '/users', to: "users#create"

  get '/login', to: "sessions#new"

  get '/user/:id', { to: 'users#show', as: 'user' }

  resources :ideas do
    resources :likes, only: [:create, :destroy]
    resources :memberships, only: [:create, :destroy, :index]
    resources :reviews, only: [:create, :destroy]
  end

  resource :session, only: [ :create, :destroy]
end
