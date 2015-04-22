Rails.application.routes.draw do
  resources :responders, param: :name
  resources :emergencies, only: :create
end
