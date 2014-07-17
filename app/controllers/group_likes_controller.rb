class GroupLikesController < ApplicationController

	def create
		group = Group.find(params[:id])
		current_user.like_group(group)

		redirect_to group
	end

	def destroy
		group = Group.find(params[:id])
		current_user.unlike_group(group)

		redirect_to group
	end
end