Spree::User.class_eval do
  Spree::PermittedAttributes.user_attributes.push(:first_name, :last_name, :phone_number, :date_of_birth,
   :month_of_birth, :head, :left_shoulder, :right_shoulder, :left_arm, addresses_attributes: [:firstname])
  validates :first_name, :last_name, :phone_number, :date_of_birth, :month_of_birth, :head, :left_shoulder, :right_shoulder, :left_arm, presence: true
  has_many :addresses
end

