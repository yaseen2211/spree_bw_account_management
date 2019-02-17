module Spree
  class StoreContactMailer < BaseMailer

    def send_email_to_vendor name, email
      mail(to: "vendor@gmail.com", from: email, subject: "You have a new message")
    end

  end
end