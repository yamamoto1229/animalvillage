class Animal < ApplicationRecord

	belongs_to :user
	attachment :image

	validates :name, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
