Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root "static_pages#home"

  resources :funds do
    post "add_user", on: :collection
    resources :statements, expect: %i(destroy update)
  end
  resources :user_funds, expect: %i(destroy)
end
