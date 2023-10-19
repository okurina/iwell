class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_many :order_lists
  has_one_attached :image

  belongs_to :category
  belongs_to :unit
  belongs_to :place

  with_options presence: true do
    validates :item_name
    validates :quantity
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :unit_id
    validates :place_id
  end

  with_options numericality: { message: 'には半角数字を使用してください', allow_blank: true} do
    validates :price
    validates :quantity
  end
  
  def order_listed_by?(user)
    order_lists.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search != ""
      Item.where('item_name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
