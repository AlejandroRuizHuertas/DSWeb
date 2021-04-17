class User < ApplicationRecord
  has_many :note
  validate :password_digest
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
end
