Spree::User.class_eval do
  
  after_create :send_welcome_email
  Spree::PermittedAttributes.user_attributes.push(:first_name, :last_name, :phone_number, :date_of_birth, :month_of_birth, :head, :left_shoulder, :right_shoulder, :left_arm)
  has_many :contact_stores
  has_many :reviews
  
  validates :first_name, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-first-name').last.try(:title) }
  validates :last_name, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-last-name').last.try(:title) }
	validates :phone_number, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-phone-number').last.try(:title) },
	                :numericality => {:message => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-phone-number-formate').last.try(:title) }, on: :update
  validates :email, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-email').last.try(:title) }
  validates_format_of  :email,:message =>Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-email-formate').last.try(:title),  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  # validates :email_confirmation, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-email-confirmation').last.try(:title) }, on: :create
  validates :password, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-password').last.try(:title) }, on: :create
  # validates :password_confirmation, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-password-confirmation').last.try(:title) }, on: :create
  validates :left_shoulder, format: {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-msr-shld-lft-formate').last.try(:title), with: /\A\d+(?:\.\d{2})?\z/ }, on: :update , if: -> {self.left_shoulder.present?}
	# validates :date_of_birth, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-birth-date').last.try(:title) }, on: :update
  # validates :month_of_birth, :presence => {:message     => Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-birth-month').last.try(:title) }, on: :update
  validate :email_matcher, on: :create


  def send_welcome_email
    Spree::UserMailer.welcome(self).deliver_now
  end

  # Comment Due To Email Confirmation Link
	# def after_confirmation
	#   Spree::UserMailer.welcome(self).deliver_now
	# end


  def full_name
    if self.first_name.present? & self.last_name.present?
      self.try(:first_name) + " " + self.try(:last_name)
    end
  end


  private
   def email_matcher
    errors.add(:email_confirmation, Spree::PageContent.from_gen_slug('user-error-msg').spec_slug('user-error-msg-email-confirmation-matcher').last.try(:title)) unless
      self.email == self.email_confirmation
   end
end

