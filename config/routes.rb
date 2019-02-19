Spree::Core::Engine.add_routes do
  get '/make_address_parimary', to: 'addresses#make_address_primary', as: 'make_address_primary'
end
