Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  resources :posts, only: [:index, :show, :create, :destroy]
  get '/authenticated', to: 'auth#authenticated'
end