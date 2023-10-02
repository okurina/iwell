class Place < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '棚' },
    { id: 3, name: '倉庫' },
    { id: 4, name: 'キャビネット' },
    { id: 5, name: '金庫' }
  ]

  include ActiveHash::Associations
  has_many :items
end