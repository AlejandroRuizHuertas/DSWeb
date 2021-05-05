class Note < ApplicationRecord
    belongs_to :user
    belongs_to :collection
    has_one_attached :image 

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    validates :collection_id, presence: true
end
