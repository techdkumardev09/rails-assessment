Rails.application.routes.draw do
  resources :persons
  root 'persons#index'
end
