Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  root "homes#index"

  resources :groups do 
    resources :expenses 
  end
end
