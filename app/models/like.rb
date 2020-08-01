class Like < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :user_id, presence: true
  validates :shop_id, presence: true
  validates_uniqueness_of :shop_id, scope: :user_id
end