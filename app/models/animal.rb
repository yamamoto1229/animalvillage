class Animal < ApplicationRecord

	belongs_to :user
	attachment :image
	has_many :animal_comments, dependent: :destroy
	has_many :tags, dependent: :destroy

	validates :name, presence: true
	validates :body, presence: true, length: {maximum: 200}
	  def self.search(search)
		if search
		  Animal.where(['name LIKE ?', "%#{search}%"])
		else
		  Animal.all
		end
	  end
end
