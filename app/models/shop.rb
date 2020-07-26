class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :image
    validates :name
    validates :prefecture_code
    validates :station
    validates :move
    validates :time
  end

  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

end
