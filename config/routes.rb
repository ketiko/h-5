Rails.application.routes.draw do
  resources :appreciations do
    member do
      get :give
    end
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
