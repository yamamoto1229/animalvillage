class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :animals, dependent: :destroy
  has_many :animal_comments, dependent: :destroy

  attachment :profile_image

  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50}

  def self.search(search)
	if search
	  User.where(['name LIKE ?', "%#{search}%"])
	else
	  User.all
	end
  end
end
