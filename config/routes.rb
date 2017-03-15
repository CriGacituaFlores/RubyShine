Rails.application.routes.draw do
  devise_for :users

  get 'angular_test', to: 'angular_test#index'

  resources :customers, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'

  get "angular_test", to: "angular_test#index"
  get "fake_billing", to: "fake_billing#show"

end
