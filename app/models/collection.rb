class Collection < ApplicationRecord
    validates :name, presence: true
    
    has_many :notes
    belongs_to :user
end