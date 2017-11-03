Rails.application.routes.draw do
  resources :bank_accounts, only: [:index]
  resources :appreciations, only: [:index] do
    member do
      get :give
      post :give, to: 'appreciations#update'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'appreciations#index'
end
