Rails.application.routes.draw do
    devise_for :users, controllers: {
        registrations: 'users/registrations'
    }
    devise_scope :user do
        get 'login', to: 'devise/sessions#new'
        post 'login', to: 'devise/sessions#create'
        delete 'logout', to: 'devise/sessions#destroy'
    end

    root "posts#index"
    resources :users, only: %i[show]
    resources :posts
end
