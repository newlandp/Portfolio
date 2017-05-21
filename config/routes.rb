Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolio_items, except: [:show]
  get 'angular-items', to: "portfolio_items#angular"
  get 'portfolio_item/:id', to: 'portfolio_items#show', as: 'portfolio_item_show'
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
