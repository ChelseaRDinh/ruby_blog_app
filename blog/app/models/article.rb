class Article < ApplicationRecord
	#Add restriction for length of blog title and content input.
	#Use 'dependent' option so that when an article is deleted, the associated comments also go with it.
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
					  length: { minimum: 5 }
end