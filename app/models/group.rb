class Group < ActiveRecord::Base
	has_many :group_memberships
	has_many :users, through: :group_memberships
	has_and_belongs_to_many :images
	has_many :group_likes

	validates :name, presence: true
	validates :description, presence: true
end


