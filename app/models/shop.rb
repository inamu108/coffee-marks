class Shop < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: 'user'

  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :image
    validates :name
    validates :station
    validates :move
    validates :time
  end

  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5
  }, presence: true

  def self.search(search)
    if search
      Shop.where('name LIKE(?) OR station LIKE(?) OR move LIKE(?) OR time LIKE(?) OR description LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Shop.all
    end
  end

end
