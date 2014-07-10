class GroupMembershipsController < ApplicationController
	def create
	  group = Group.find(params[:id]) #WERE NOT DOING GROUP_ID IN PARAMS BECAUSE THIS IS A MEMBER ROUTE
	  group.users << current_user
	  redirect_to group, notice: "Joined group successfully"
	end


	def destroy
		group = GroupMembership.find_by(user: current_user, group_id: params[:id])
		group.destroy
		redirect_to dashboard_path
		# group = Group.find(params[:id]) THIS IS ANOTHER WAY CHECK USER.RB MODEL TO SEE METHODS USED IN HERE LIKE LEAVE
		# current_user.leave(group)
	end
end
