Rails.application.routes.draw do
  resources :carts, except: [:destroy, :edit]
  resources :items
  resources :profiles
  root 'items#index'
  get 'my_items', to: 'items#my_items'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
