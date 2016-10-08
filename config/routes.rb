Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get '/api/authorized', to: 'api#authorized'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
