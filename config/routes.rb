Rails.application.routes.draw do
  resources :responders, param: :name
  resources :emergencies, only: [:index, :show, :create], param: :code
end
