class Spree::ContactStore < ActiveRecord::Base
  belongs_to :vendor

  after_create :send_email_to_vendor

  def send_email_to_vendor
    Spree::StoreContactMailer.send_email_to_vendor(self.vendor.name, "vendor@gmail.com").deliver_now
  end

end
