Rails.application.routes.draw do

  
  
  get 'photos/create'
  get 'photos/destroy'
  root 'static_page#home'

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
    end
    resources :photos,only:[:create,:destroy]
    resources :reservations, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
