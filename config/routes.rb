Rails.application.routes.draw do
  # Home controller (top-level) paths. index is our root.
  root 'home#index'
  get 'about', to: "home#about"
  get 'faq', to: "home#faq"

  # User signup/login/etc. paths via devise
  devise_for :users

  # User's page maps to their collection which is handled by index action in the images controller.
  get 'users/:id', to: 'images#index', as: 'user'
  resources :images, except: [:index]
end
