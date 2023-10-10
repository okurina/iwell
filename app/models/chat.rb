class Chat < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_one_attached :image

  validates :message, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
