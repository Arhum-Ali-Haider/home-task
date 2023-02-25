Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'v1/github#search'
  
  namespace :v1 do
    # resources :github
    namespace :github do
      get '/search', to: '/v1/github#search'
    end
  end

end
