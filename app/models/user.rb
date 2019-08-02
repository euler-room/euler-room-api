class User < ApplicationRecord
  attr_accessor :auth_token
  has_secure_password
  validates_presence_of   :username
  validates_uniqueness_of :username, case_sensitive: true

  has_one :cover_letter

  before_create :generate_confirmation_instructions

  def confirmation_token_valid?
    (self.confirmation_sent_at + 30.days) > Time.now.utc
  end

  def mark_as_confirmed!
    self.confirmation_token = nil
    self.confirmed_at = Time.now.utc
    save
  end

  private def downcase_email
    self.email = self.email.delete(' ').downcase
  end

  private def generate_confirmation_instructions
    self.confirmation_token = SecureRandom.hex(10)
    self.confirmation_sent_at = Time.now.utc
  end
end
