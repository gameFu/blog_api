Rails.application.routes.draw do
  namespace :backend do
    post 'authorize' => 'sessions#create'
    resource :admins, only: [:update]
  end
end
