class GroupsController < ApplicationController
	before_action :require_login, except: [:index, :show]

	def new
		@group = Group.new
	end

	def index
		@groups = Group.all
	end

	def create
		@group = Group.new(group_params)
		@group.users << current_user
		
		if @group.save
			GroupMembership.create(user: current_user, group: @group)
			redirect_to @group
		else
			render :new
		end
	end

	def show
		@group = Group.find(params[:id])
	end

	private

	def group_params
  	params.
  	  require(:group). # THE PERIODS COME BECAUSE THIS USED TO BE A ONE LINE METHOD, BUT WE BROKE IT INTO THREE LINES FOR FORMATTING
  	  permit(:name, :description) #THIS PERMITS THE VALUES NAME AND DESCRIPTION FOR GALLERY
    end

end
