class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '備品' },
    { id: 3, name: '在庫' },
  ]

  include ActiveHash::Associations
  has_many :items
end