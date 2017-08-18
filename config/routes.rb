Rails.application.routes.draw do
  get 'projects/index'

  get 'projects/new'

  get 'projects/create'

  get 'projects/edit'

  get 'projects/show'

  get 'projects/update'

  get 'projects/destroy'

  get 'users/index'

  get 'users/edit'

  get 'users/show'

  mount Attachinary::Engine => "/attachinary"
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  # because we display the registrations controller (devise)

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
