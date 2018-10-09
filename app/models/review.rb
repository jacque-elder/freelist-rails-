class Review < ApplicationRecord
  belongs_to :user
  belongs_to :service
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :service_id, presence: true
  validates :rating, presence: true
end
