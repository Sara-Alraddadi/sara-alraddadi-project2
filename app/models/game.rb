class Game < ApplicationRecord
    has_many :reviews

    mount_uploader :img, ImageUploader 
end
