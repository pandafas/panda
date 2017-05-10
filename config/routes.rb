Rails.application.routes.draw do

  devise_for :users
  resources :users
  post 'static_pages/thank_you'

  get 'static_pages/thank_you'

  get 'static_pages/landing_page'

  

  resources :products
  get 'static_pages/projects'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/landing_page'
  root 'static_pages#landing_page'


  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

