Spree::Address.class_eval do
	_validators.reject! { |key, _| key == :lastname }
	_validate_callbacks.each do |callback|
	  callback.raw_filter.attributes.reject! { |key| key == :lastname } if callback.raw_filter.respond_to?(:attributes)
	end

	validates :firstname, :presence => {:message     => Spree::PageContent.from_gen_slug(I18n.locale,'address-error-msg').spec_slug('address-error-msg-contact-name').last.title }
	validates :phone, :presence => {:message     => Spree::PageContent.from_gen_slug(I18n.locale,'address-error-msg').spec_slug('address-error-msg-contact-number').last.title },
                    :numericality => {:message => Spree::PageContent.from_gen_slug(I18n.locale,'address-error-msg').spec_slug('address-error-msg-contact-number-formate').last.title }
	validates :address1, :presence => {:message     => Spree::PageContent.from_gen_slug(I18n.locale,'address-error-msg').spec_slug('address-error-msg-address-1').last.title }
	validates :city, :presence => {:message     => Spree::PageContent.from_gen_slug(I18n.locale,'address-error-msg').spec_slug('address-error-msg-town').last.title }
	validates :state, :presence => {:message     => Spree::PageContent.from_gen_slug(I18n.locale,'address-error-msg').spec_slug('address-error-msg-state').last.title }
	validates :country, :presence => {:message     => Spree::PageContent.from_gen_slug(I18n.locale,'address-error-msg').spec_slug('address-error-msg-country').last.title }

	def require_zipcode?
	  false
	end

  belongs_to :user
end