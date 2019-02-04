Spree::Address.class_eval do
	_validators.reject! { |key, _| key == :lastname }
	_validate_callbacks.each do |callback|
	  callback.raw_filter.attributes.reject! { |key| key == :lastname } if callback.raw_filter.respond_to?(:attributes)
	end

	validates :phone,  :presence => true,
                     :numericality => true
        

	def require_zipcode?
	  false
	end

  belongs_to :user
end