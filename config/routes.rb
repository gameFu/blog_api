Rails.application.routes.draw do
  namespace :backend do
    post 'authorize' => 'sessions#create'
  end
end
