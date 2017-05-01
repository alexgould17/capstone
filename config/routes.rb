Rails.application.routes.draw do
  devise_for :users
  # Home controller (top-level) paths. index is our root.
  root 'home#index'
  get 'about', to: "home#about"
  get 'faq', to: "home#faq"
end
