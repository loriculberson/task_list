Rails.application.routes.draw do

  root "home#index"

  resources :users
  resources :task_lists

end
