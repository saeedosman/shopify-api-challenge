Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :shops do
      resources :products do
        resources :line_items
      end
      resources :orders do
        resources :line_items
      end
    end
  end
end
