class User < ApplicationRecord
  has_many :notes
  has_many :collections
  validate :password_digest
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
end
