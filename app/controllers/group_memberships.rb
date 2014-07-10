class GroupMembershipsController < ApplicationController
	def create
	  group = Group.find(params[:id]) #WERE NOT DOING GROUP_ID IN PARAMS BECAUSE THIS IS A MEMBER ROUTE
	  current_user.join(group)
	  redirect_to group, notice: "Joined group successfully"
	end
end
