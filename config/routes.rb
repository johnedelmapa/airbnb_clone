Rails.application.routes.draw do
  root 'static_page#home'
  get '/search',to:'static_page#search'

  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_up: 'registration', sign_out: 'logout'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks',registrations:'registrations'}
  resources :users, only: [:show]
  resources :rooms do
    member do
      get 'listing'
      get 'price'
      get 'description'
      get 'photos'
      get 'amenities'
      get 'location'
      get 'preload'
      get 'preview'
    end
    resources :photos,only:[:create,:destroy]
    resources :reservations, only: [:create]
  end
  get "your_trips", to: "reservations#your_trips"
  get "your_reservations", to: "reservations#your_reservations"
  resources :guest_reviews, only:[:create,:destroy]
  resources :host_reviews, only:[:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
