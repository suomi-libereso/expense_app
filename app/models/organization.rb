class Organization < ApplicationRecord
  has_many :users, dependent: :destroy,inverse_of: :organization
  has_many:requests, through: :users
  
  accepts_nested_attributes_for :users, allow_destroy: true
  validates :name, presence: true, length: { maximum: 50 }
end
