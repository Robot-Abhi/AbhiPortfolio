class Topic < ApplicationRecord
	validates_presence_of :title, :body, :main_image, :thumb_image

	has_many :blogs
end
