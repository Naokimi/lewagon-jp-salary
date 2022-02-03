Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :salaries, only: %i[new create]
  get '/salaries', to: redirect('salaries/new')
end
