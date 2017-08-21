Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]  do
    collection do
      resources :projects
      resources :bookings, only: [:destroy]
    end
  end
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
