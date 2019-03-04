class Product < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :category
    belongs_to :user
    paginates_per 9
end
