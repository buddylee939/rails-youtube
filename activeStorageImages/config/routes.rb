Rails.application.routes.draw do
  resources :pins do
    member do
      delete :delete_pict_attachment
    end
  end
  root 'pins#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
