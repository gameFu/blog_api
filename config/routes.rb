Rails.application.routes.draw do
  namespace :backend do
    post 'authorize' => 'sessions#create'
    resources :admins, only: [:update]
    resources :articles
  end
end
