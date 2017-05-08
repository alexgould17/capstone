Rails.application.routes.draw do
  # Home controller (top-level) paths. index is our root.
  root 'home#index'
  get 'about', to: "home#about"
  get 'faq', to: "home#faq"

  # User signup/login/etc. paths via devise
  devise_for :users
end
