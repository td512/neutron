class EmailAddress < ApplicationRecord
  def self.exists?(email_address)
    EmailAddress.find_by(email_address: email_address).present?
  end

  def self.create(email_address)
    EmailAddress.create(email_address: email_address)
  end
end
