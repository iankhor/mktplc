Rails.application.routes.draw do
  resources :rides do
    collection do
      get 'buy_ticket', to: 'rides#buy_ticket'
      get 'reset_ticket', to: 'rides#reset_ticket'
      get 'hire', to: 'rides#hire'
    end  
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rides#index'

end
