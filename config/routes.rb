Rails.application.routes.draw do
  resources :responders, only: [:index, :show, :create, :update], param: :name
end
