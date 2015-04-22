Rails.application.routes.draw do
  resources :responders, only: :create
end
