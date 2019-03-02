class Article < ApplicationRecord
	#Add restriction for length of blog title and content input.
	has_many :comments
	validates :title, presence: true,
					  length: { minimum: 5 }
end