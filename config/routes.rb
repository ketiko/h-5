Rails.application.routes.draw do
  resources :account_transactions
  resources :bank_accounts
  resources :appreciations do
    member do
      get :survey
    end
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'appreciations#index'
end
