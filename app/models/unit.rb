class Unit < ActiveHash::Base
  self.data = [
    { id: 1, name: '--単位--' },
    { id: 2, name: '箱' },
    { id: 3, name: '個' },
    { id: 4, name: '本' },
    { id: 5, name: '枚' },
    { id: 6, name: '冊' }
  ]

  include ActiveHash::Associations
  has_many :items
end