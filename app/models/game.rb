class Game < ApplicationRecord
    has_many :reviews , dependent: :destroy
    belongs_to :user

    mount_uploader :img, ImageUploader 
end
