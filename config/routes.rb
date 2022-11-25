Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get "/logout", :to => "devise/sessions#destroy" # Add a custom sing out route for user sign out
  end
  
  authenticated :user do
    root to: 'groups#index', as: :authenticated_root
  end

  root "homes#index"

  resources :groups do 
    resources :expenses 
  end
end
