Rails.application.routes.draw do

  get 'pages/help'

  get 'pages/legal'

  get 'pages/about'

  get 'pages/donate'

  get 'pages/profile'

  get 'pages/authors'

  get 'pages/my_profile'

  get 'posts/new/:blog_id', to: 'posts#new', as: 'new_post'

  get 'posts', to: 'posts#index'

  post 'posts', to: 'posts#create'

  root to: 'pages#home'

  resources :blogs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
