class Image < ActiveRecord::Base
	belongs_to :gallery

	validates :name, presence: true
	validates :description, presence: true
	validates :url, presence: true
	#one can also see this as validates_presence_of :name

end