Rails.application.routes.draw do
  resources :reservations
  resources :flights
  get '/flights/:id/info', constraints: lambda { |req| req.format == :json }, to: 'flights#info'
  resources :airplanes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
