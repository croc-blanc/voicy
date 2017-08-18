Rails.application.routes.draw do
  resources :users, only: [:index, :edit, :show, :update]  do
    resources :projects
  end

  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
