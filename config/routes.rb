Rails.application.routes.draw do
  root to: 'questions#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :questions do
    resources :answers
  end
  resources :sessions
  resources :votes
  resources :best_answers
end
