Rails.application.routes.draw do
  devise_for :users, controllers: {

  	registrations: 'users/registrations',
  	sessions: 'users/sessions'
  }


  resources :orders
  resources :services, only: [:index, :show]
  root "services#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
