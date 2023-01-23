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
  ############################
  # Costem Methods
  ############################
  after_save_commit { post.touch }

  after_create_commit { broadcast_prepend_to [post, :comments] }
  after_update_commit { broadcast_replace_to [post, :comments] }

  after_destroy_commit { broadcast_remove_to :comments }
end
