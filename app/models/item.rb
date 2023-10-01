class Item < ApplicationRecord
  belongs_to :user
  belongs_to :order_item
  has_one_attached :image

end
