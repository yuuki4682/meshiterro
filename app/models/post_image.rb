class PostImage < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/asset/images/no_image.jpg')
      image.attach(io: file.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
      image
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  validates :shop_name, presence: true
  validates :image, presence: true
  
end
