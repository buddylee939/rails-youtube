Rails.application.routes.draw do
  resources :drops
  root 'drops#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
