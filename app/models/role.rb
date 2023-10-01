class Role < ApplicationRecord
  has_many :users, through: :user_roles
  validates :role_name, presence: true
end