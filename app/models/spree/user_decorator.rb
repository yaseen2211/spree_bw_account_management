Spree::User.class_eval do
  Spree::PermittedAttributes.user_attributes.push(:first_name, :last_name, :phone_number, :date_of_birth, :month_of_birth, :head, :left_shoulder, :right_shoulder, :left_arm)


 #  validates :first_name, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-first-name').last.try(:title) }
 #  validates :last_name, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-last-name').last.try(:title) }
	# validates :phone_number, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-phone-number').last.try(:title) },
	#                 :numericality => {:message => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-phone-number-formate').last.try(:title) }, on: :update
 #  validates :email, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-email').last.try(:title) }
 #  validates_format_of  :email,:message =>Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-email-formate').last.try(:title),  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
 #  validates :email_confirmation, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-email-confirmation').last.try(:title) }
 #  validates :password, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-password').last.try(:title) }, on: :create
 #  validates :password_confirmation, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-password-confirmation').last.try(:title) }, on: :create
 #  validates :left_shoulder, presence: {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-msr-shld-lft-formate').last.try(:title) }, format: { with: /\A\d+(?:\.\d{2})?\z/ }, on: :update
	# validates :date_of_birth, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-birth-date').last.try(:title) }
 #  validates :month_of_birth, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-birth-month').last.try(:title) }
  validate :email_matcher, on: :create

  has_many :addresses

  private
   def email_matcher
    errors.add(:email_confirmation, Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-email-confirmation-matcher').last.try(:title)) unless
      self.email == self.email_confirmation
   end
end

