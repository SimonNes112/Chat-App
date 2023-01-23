class Like < ApplicationRecord
  ############################
  # Validations
  ############################
  validates :user_id, uniqueness: { scope: :post_id }
  ############################
  # Associations
  ############################
  belongs_to :user
  belongs_to :post
  ############################
  # Turbo Streams
  ############################

  after_save_commit { post.touch }
  after_destroy_commit { post.touch }
end
