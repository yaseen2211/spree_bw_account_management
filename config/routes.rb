Spree::Core::Engine.add_routes do


  get 'invoice/:id(/:template)', to: 'invoice#show'
  resources :users do
  	resources :user_addresses
  end

  resources :vendors do
    resources :contact_stores
  end

  get '/make_address_parimary', to: 'addresses#make_address_primary', as: 'make_address_primary'

end
