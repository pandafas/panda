Rails.application.routes.draw do
  get 'static_pages/main'

  resources :products
  get 'static_pages/projects'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/main'
  root 'static_pages#main'

  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
