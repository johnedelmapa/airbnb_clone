Rails.application.routes.draw do
  resources :users, only: [:show]
  root 'static_page#home'

  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_up: 'registration', sign_out: 'logout'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks',registrations:'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
