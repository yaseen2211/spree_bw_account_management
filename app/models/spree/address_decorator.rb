Spree::Address.class_eval do
_validators.reject! { |key, _| key == :zipcode || key == :state_id || key == :state }
# _validate_callbacks.each do |callback|
      # callback.raw_filter.attributes.reject! { |key| key == :zipcode || key == :state_id || key == :state } if callback.raw_filter.respond_to?(:attributes)
    # end
end