class Spree::ContactStore < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :user
  belongs_to :order

  after_create :send_email_to_vendor

  validates :query_type, :presence => {:message     => "Can't Blank" }
  validates :subject, :presence => {:message     => "Can't Blank" }
  validates :query, :presence => {:message     => "Can't Blank" }

  def send_email_to_vendor
    Spree::StoreContactMailer.send_email_to_vendor(self.vendor.name, "vendor@gmail.com").deliver_now
  end

end
