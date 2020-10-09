Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, except: [:new, :create] do
    get 'search', on: :collection
    resources :meetings, only: [:new, :create]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index, :show ] do
        get 'search', on: :collection
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

