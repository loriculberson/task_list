Rails.application.routes.draw do

  root "home#index"
  post '/login'=> 'sessions#create'

  resources :users
  resources :task_lists

end
