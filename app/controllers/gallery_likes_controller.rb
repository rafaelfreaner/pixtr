class GalleryLikesController < ApplicationController

	def create
		gallery = Gallery.find(params[:id])
		current_user.like_gallery(gallery)

		redirect_to gallery
	end

	def destroy
		gallery = Gallery.find(params[:id])
		current_user.unlike_gallery(gallery)

		redirect_to gallery
	end
end