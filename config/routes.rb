Rails.application.routes.draw do
  root 'babies#index' 
  resources :babies do
    resources :breastfeedings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
