Rails.application.routes.draw do

  get 'pages/help'

  get 'pages/legal'

  get 'pages/about'

  get 'pages/donate'

  root to: 'pages#home'

  resources :blogs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
