Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments
  end

  root to: "home#index"
end
