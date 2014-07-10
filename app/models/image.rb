class Image < ActiveRecord::Base
	belongs_to :gallery
	has_many :comments
	has_and_belongs_to_many :groups

	has_many :likes
	has_many :liking_users, through: :likes, source: :user

	validates :name, presence: true
	validates :description, presence: true
	validates :url, presence: true
	#one can also see this as validates_presence_of :name but for older ruby versions

end