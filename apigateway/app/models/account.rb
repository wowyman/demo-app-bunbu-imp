class Account < ApplicationRecord
  has_secure_password

  # Basic password validation, configure to your liking.
  validates_length_of :password, maximum: 72, minimum: 6, allow_nil: true, allow_blank: false
  validates_confirmation_of :password, allow_nil: true, allow_blank: false

  before_validation {
    (self.email = self.email.to_s.downcase) && (self.name = self.name.to_s.downcase)
  }

  # Make sure email and username are present and unique.
  validates_presence_of :email
  validates_presence_of :name
  validates_uniqueness_of :email
  validates_uniqueness_of :name

  # This method gives us a simple call to check if a user has permission to modify.
  def can_modify_account?(account_id)
    role == "admin" || id.to_s == user_id.to_s
  end

  # This method tells us if the user is an admin or not.
  def is_admin?
    role == "admin"
  end
end
