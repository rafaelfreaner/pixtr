class User < ActiveRecord::Base
	has_many :galleries
	has_many :comments
	has_many :group_memberships
	has_many :groups, through: :group_memberships
	has_many :likes

	has_many :image_likes, through: :likes, source: :content, source_type: "ImageLike"
	has_many :gallery_likes, through: :likes, source: :content, source_type: "GalleryLike"
	has_many :group_likes, through: :likes, source: :content, source_type: "GroupLike"

	has_many :liked_images, through: :image_likes, source: :image
	has_many :liked_galleries, through: :gallery_likes, source: :gallery
	has_many :liked_groups, through: :group_likes, source: :group
	
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
		image_like = ImageLike.new(image_id: image.id)
		likes.create(content: image_like)
		# liked_images << image
	end

	def unlike(image)
		image_like = image_likes.find_by(image_id: image.id)
		like = likes.find_by(content_id: image_like.id)
		like.destroy
		# liked_images.delete(image)
	end

	def likes_gallery?(gallery)
		liked_galleries.include?(gallery)
	end

	def like_gallery(gallery)
		gallery_like = GalleryLike.new(gallery_id: gallery.id)
		likes.create(content: gallery_like)
	end

	def unlike_gallery(gallery)
		gallery_like = gallery_likes.find_by(gallery_id: gallery.id)
		like = likes.find_by(content_id: gallery_like.id)
		like.destroy
	end

	def likes_group?(group)
		liked_groups.include?(group)
	end

	def like_group(group)
		group_like = GroupLike.new(group_id: group.id)
		likes.create(content: group_like)
	end

	def unlike_group(group)
		group_like = group_likes.find_by(group_id: group.id)
		like = likes.find_by(content_id: group_like.id)
		like.destroy
	end
end









