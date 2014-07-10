class GalleriesController < ApplicationController
  before_action :require_login

  def index
  	@galleries = Gallery.all
  end

  def new
  	@gallery = Gallery.new
  end

  def create
  	# render text: params.inspect   THIS SHOWS ALL THE PARAMS FOR :GALLERY
    params_with_user_id = gallery_params.merge(
      user_id: current_user.id
      )
  	Gallery.create(params_with_user_id)
  	redirect_to "/galleries"
  end

  def show
    @gallery = find_gallery
  end

  def destroy
  	@gallery = find_gallery
  	@gallery.destroy
  	redirect_to "/galleries"
  end

  def edit
  	@gallery = find_gallery
  end

  def update
  	@gallery = find_gallery
  	if @gallery.update(gallery_params) #we are calling the method below in the private section
  		redirect_to @gallery
  	else
  		render:edit
  	end
  end

  private

  def find_gallery
  	Gallery.find(params[:id])
  end

  def gallery_params
  	params.
  	  require(:gallery). # THE PERIODS COME BECAUSE THIS USED TO BE A ONE LINE METHOD, BUT WE BROKE IT INTO THREE LINES FOR FORMATTING
  	  permit(:name, :description) #THIS PERMITS THE VALUES NAME AND DESCRIPTION FOR GALLERY
  end


end


# EDIT IS SO SIMILAR TO NEW SO SIMILAR IS THE SAME 

# UPDATE 

#FOR CONTROLLERS 
#index
#show 			READ
# new create 	CREATE
# edit update 	UPDATE
#destroy		DELETE