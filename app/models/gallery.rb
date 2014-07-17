class Gallery < ActiveRecord::Base
	has_many :images
	belongs_to :user
	has_many :gallery_likes

	validates :name, presence: true
	validates :description, presence: true
end