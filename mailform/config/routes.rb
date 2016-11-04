Rails.application.routes.draw do
  # When there's a get request to website.com/contact'
  # points to contact controller, index action
  get 'contact', to: 'contact#index'
  root 'contact#index'
  post 'contact', to: 'contact#mail'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
