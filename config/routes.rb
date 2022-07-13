Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments
  end
  
  resources :users do
    scope module: :users do
      resources :posts do
        resources :comments
      end
    end
  end

  root to: "home#index"
end
