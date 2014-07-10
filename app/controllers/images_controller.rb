class ImagesController < ApplicationController
	def show
		@image = Image.find(params[:id])
		@comment = Comment.new
		@gallery = @image.gallery
	end

	def new
		@image = Image.new
		@gallery = Gallery.find(params[:gallery_id])
	end

	def create
		@gallery = find_gallery
		@image = Image.create(image_params)
		@image.gallery_id = params[:gallery_id]
		if @image.save
			redirect_to gallery_path(@image.gallery)
		else
			render :new
		end
		
	end

	def destroy
		image = Image.find(params[:id])
		gallery = image.gallery
		image.destroy
		redirect_to gallery_path(gallery)
	end

	def edit
		
		@image = Image.find(params[:id])
	end

	def update
		@gallery = find_gallery
	  	@image = Image.find(params[:id])
	  	if @image.update(image_params)  #we are calling the method below in the private section
	  	  redirect_to @gallery
	  	else
	  	  render :edit
	  	end
  	end

	private

  def find_gallery
  	Gallery.find(params[:gallery_id])
  end

  def image_params
  	params.
  	  require(:image). # THE PERIODS COME BECAUSE THIS USED TO BE A ONE LINE METHOD, BUT WE BROKE IT INTO THREE LINES FOR FORMATTING
  	  permit(:name, :description, :url) #THIS PERMITS THE VALUES NAME AND DESCRIPTION FOR GALLERY
  end

end