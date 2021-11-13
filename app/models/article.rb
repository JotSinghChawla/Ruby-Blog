class Article < ApplicationRecord

    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: { minimum: 5 }    
    validates :body, presence: true
    validates :tag, presence: true
    validates :image_link, presence: true
            #    format: { with: /\A(https:\/\/.+)|(http:\/\/.+)\z/i, message: 'Must be a URL for GIF, JPG or PNG image.' }
end
