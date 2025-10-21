Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :messages, only: [:index]
      end
      
      resources :categories
      
      resources :conversations do
        resources :messages, only: [:index, :create]
      end
      
      resources :messages do
        resources :reactions, only: [:index, :create, :destroy]
      end
      
      resources :reactions, only: [:index]
    end
  end
end
