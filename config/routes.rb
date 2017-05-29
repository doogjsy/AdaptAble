Rails.application.routes.draw do

  devise_for :users
  root to: "clients#index"
  resources :clients do
    collection do
      post 'index_search'
    end
  end
  resources :client_contacts, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
