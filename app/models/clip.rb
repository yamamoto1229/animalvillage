class Clip < ApplicationRecord

	validates :user_id, :uniqueness => {:scope => :animal_id}

	belongs_to :user
	belongs_to :animal
end
