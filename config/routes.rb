Rails.application.routes.draw do

  root "home#index"
  post '/login'=> 'sessions#create'
  get '/logout'=> 'sessions#destroy'

  resources :users
  resources :task_lists do 
    resources :tasks do
    end
  end

end
