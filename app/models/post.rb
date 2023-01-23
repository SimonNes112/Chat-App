class Post < ApplicationRecord
  ############################
  # Validations
  ############################
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 300 }
  ############################
  # Associations
  ############################
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  ############################
  # Costem Methods
  ############################
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  ############################
  # Turbo Streams
  ############################
  after_create_commit { broadcast_prepend_to :posts }
  after_update_commit { broadcast_replace_to :posts }

  after_destroy_commit { broadcast_remove_to :posts }
end
