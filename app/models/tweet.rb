class Tweet < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :img, ImgUploader
end
