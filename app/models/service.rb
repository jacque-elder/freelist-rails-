class Service < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
