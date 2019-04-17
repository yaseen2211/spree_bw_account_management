Spree::Product.class_eval do
 Spree::PermittedAttributes.product_attributes.push << [:to_home, :property]
 scope :home_products, -> {where("to_home=?", true)}
end



