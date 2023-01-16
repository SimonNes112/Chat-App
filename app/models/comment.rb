class Comment < ApplicationRecord
    ############################
    # Validations
    ############################
    validates :content, presence: true, length: { maximum: 300 }
    ############################
    # Associations
    ############################
    belongs_to :user 
    belongs_to :post
end
