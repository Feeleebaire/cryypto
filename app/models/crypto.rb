class Crypto < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :posts
end
