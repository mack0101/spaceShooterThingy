Rails.application.routes.draw do
  devise_for :users

  get 'scoreboard', to: 'scores#index'
  resources :scores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
