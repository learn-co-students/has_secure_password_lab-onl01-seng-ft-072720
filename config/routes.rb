Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/', to: 'users#new'

post '/', to: 'users#create'

post 'sessions/create', to: 'sessions#create'

get '/homepage', to: 'users#homepage'

end
