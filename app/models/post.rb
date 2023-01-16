class Post < ApplicationRecord
    ############################
    # Validations
    ############################
    validates :title, presence: true, length: { maximum: 50 }
    validates :content, presence: true, length: { maximum: 300 }
    ############################
    # Associations
    ############################
    belongs_to :user ,dependent: :destroy
    has_many :comments, dependent: :destroy
end
