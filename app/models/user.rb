class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: { case_sensitive: false,
                                                                                               message: "信箱已被使用！" }

  private

  def save_email
    self.email = email.downcase
  end
end
