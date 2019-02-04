Spree::Core::Engine.add_routes do
  # Add your extension routes here
  resources :users do
  	resources :user_addresses
  end

  get '/make_address_parimary', to: 'user_addresses#make_address_primary', as: 'make_address_primary'
end
