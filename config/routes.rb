Rails.application.routes.draw do
  root to: 'games#index'
  get 'games/index'

  get 'banned', to: 'users#banned'

  devise_for :users, controllers: { registrations: "registrations" }

  get 'scoreboard', to: 'scores#index'
  resources :scores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
