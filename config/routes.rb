Rails.application.routes.draw do

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  resources :users, only: [:index, :edit, :show, :update]  do
    collection do
      resources :projects
      resources :bookings, only: [:new, :create, :destroy]
    end
  end
  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
