class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  # has_many :post_images, dependent: :destroy
  attachment :image
  attachment :profile_image

  validates :introduction, length: { maximum: 50 }
  validates :name, presence: true
  validates :name, length: { in: 2..20 }
  validates :name, uniqueness: true
end
