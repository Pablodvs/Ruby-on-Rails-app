Rails.application.routes.draw do
  resources :brands
  resources :products, path: '/'
end
