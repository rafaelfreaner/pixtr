class Image < ActiveRecord::Base
	belongs_to :gallery
	has_many :comments
	has_and_belongs_to_many :groups

	has_many :likes

	validates :name, presence: true
	validates :description, presence: true
	validates :url, presence: true
	#one can also see this as validates_presence_of :name but for older ruby versions

	#Tagging
	acts_as_taggable # Alias for acts_as_taggable_on :tags
end