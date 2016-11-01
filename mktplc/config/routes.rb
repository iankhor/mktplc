Rails.application.routes.draw do
  resources :carts, except: [:destroy, :edit]
  resources :items
  resources :profiles
  root 'items#index'
  get 'my_items', to: 'items#my_items'
  get 'my_cart', to: 'item_to_carts#show_cart'
  get 'add_to_cart', to: 'item_to_carts#add_to_cart'
  get 'cart_pay', to: 'carts#pay'
  get 'sold', to: 'items#sold'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
