class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :username, presence: true

  #いいねしているか確認する
  def already_favorited?(book)
    self.favorites.exists?(book_id: book.id)
  end
end
