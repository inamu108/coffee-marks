class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :image
    validates :name
    validates :evaluation
    validates :prefecture_code
    validates :station
    validates :move
    validates :time
  end

end
