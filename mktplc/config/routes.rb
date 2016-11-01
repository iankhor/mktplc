Rails.application.routes.draw do
  resources :items
  resources :profiles
  root 'static_pages#home'
  get 'my_items', to: 'items#my_items'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
