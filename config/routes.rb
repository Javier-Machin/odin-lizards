Rails.application.routes.draw do
  resources :lizards
  root 'lizards#index'

end
