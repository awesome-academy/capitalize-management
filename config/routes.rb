Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root "static_pages#home"
  resources :funds, expect: %i(destroy) do
    resources :statements, expect: %i(destroy update)
  end
  resources :user_funds, expect: %i(destroy)
end
