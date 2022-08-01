Rails.application.routes.draw do
    devise_for :users, controllers: {
        registrations: 'users/registrations'
    }
    devise_scope :user do
        get 'login', to: 'devise/sessions#new'
        post 'login', to: 'devise/sessions#create'
        delete 'logout', to: 'devise/sessions#destroy'
    end
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    root "posts#index"
    resources :users, only: %i[show]
end
