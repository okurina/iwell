class Chat < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_one_attached :image

  validates :message, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
