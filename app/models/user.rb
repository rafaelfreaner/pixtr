class User < ActiveRecord::Base
	has_many :galleries
	has_many :comments
	has_many :group_memberships
	has_many :groups, through: :group_memberships
	has_many :likes
	has_many :liked_images, through: :likes, source: :image
	
	validates :email, presence: :true, uniqueness: true
	validates :password_digest, presence: true

	def join(group)
		groups << group
	end

	def member?(group)
		groups.include(group)
	end

	def leave(group)
		groups.delete(group)
	end

	def likes?(image)
		liked_images.include?(image)
	end

	def like(image)
		liked_images << image
	end

	def unlike(image)
		liked_images.delete(image)
	end
end
