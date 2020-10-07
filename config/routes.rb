Rails.application.routes.draw do

  root to: "users#welcome"

  get 'users/new'
  post 'users/create'
  get 'users/homepage'

  get 'sessions/new'
  post 'sessions/create'
  post 'sessions/destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
