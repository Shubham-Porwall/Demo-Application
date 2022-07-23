class Customer < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensetive: false }, 
    format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :password, presence: true, length: { minimum: 2, maximum: 10 }
end
