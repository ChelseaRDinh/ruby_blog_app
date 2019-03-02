class Article < ApplicationRecord
	#Add restriction for length of blog title and content input.
	validates :title, presence: true,
					  length: { minimum: 5 }
end