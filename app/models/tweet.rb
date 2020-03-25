class Tweet < ApplicationRecord
  belongs_to :user, dependent: :destroy
  mount_uploader :img, ImgUploader
end
