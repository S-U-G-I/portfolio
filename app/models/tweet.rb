class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :img, presence: true
  validates :tweet, presence: true, length: { maximum: 100 }
  mount_uploader :img, ImgUploader
end
