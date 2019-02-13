Spree::Address.class_eval do
	_validators.reject! { |key, _| key == :lastname }
	_validate_callbacks.each do |callback|
	  callback.raw_filter.attributes.reject! { |key| key == :lastname } if callback.raw_filter.respond_to?(:attributes)
	end

	# validates :firstname, :presence => {:message     => Spree::PageContent.from_gen_slug('address-error-msg').spec_slug('address-error-msg-contact-name').last.try(:title) }
	# validates :phone, :presence => {:message     => Spree::PageContent.from_gen_slug('address-error-msg').spec_slug('address-error-msg-contact-number').last.try(:title) },
 #                    :numericality => {:message => Spree::PageContent.from_gen_slug('address-error-msg').spec_slug('address-error-msg-contact-number-formate').last.try(:title) }
	# validates :address1, :presence => {:message     => Spree::PageContent.from_gen_slug('address-error-msg').spec_slug('address-error-msg-address-1').last.try(:title) }
	# validates :city, :presence => {:message     => Spree::PageContent.from_gen_slug('address-error-msg').spec_slug('address-error-msg-town').last.try(:title) }
	# validates :state, :presence => {:message     => Spree::PageContent.from_gen_slug('address-error-msg').spec_slug('address-error-msg-state').last.try(:title) }
	# validates :country, :presence => {:message     => Spree::PageContent.from_gen_slug('address-error-msg').spec_slug('address-error-msg-country').last.try(:title) }

	def require_zipcode?
	  false
	end

  belongs_to :user
end