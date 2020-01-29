class Request < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true, length: { maximum: 11 }, numericality: { only_integer: true, greater_than: 0 }
  validates :type, presence: true
  validates :account, presence: true
  attribute :status, :boolean, default: false
  attribute :approval, :boolean, default: false
  
end
