Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to: 'merchants#show'
  post '/merchants', to: 'merchants#create'
  get '/merchants/:id/edit', to: 'merchants#edit'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'

  get '/items', to: 'items#index'
  get '/items/:id/edit', to: 'items#edit'
  get '/items/:id', to: 'items#show'
  patch '/items/:id', to: 'items#update'
  get '/merchants/:merchant_id/items', to: 'items#index'
  post '/merchants/:merchant_id/items', to: 'items#create'
  get '/merchants/:merchant_id/items/new', to: 'items#new'
end
