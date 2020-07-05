class AnimalComment < ApplicationRecord
	belongs_to :user
	belongs_to :animals, optional: true
end
