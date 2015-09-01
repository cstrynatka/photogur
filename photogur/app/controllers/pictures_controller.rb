class PicturesController < ApplicationController

	def index
		@pictures = Picture.all
	end

	def show
		@picture = Picture.find(params[:id]) 
	end

	def new
		@picture = Picture.new
	end

	def create
		# Make a new picture with whst picture_params returns
		# (which is a method we're calling)
		@picture = Picture.new(picture_params)
		if @picture.save
			# If the save for the picture was successful, go to index.html.erb
			redirect_to pictures_url
		else
			# Otherwise render the view associated with the action :new (i.e. new.html.erb)
		render :new
		# :text => "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
	end
end

end

private
def picture_params
	params.require(:picture).permit(:artist, :title, :url)
end
