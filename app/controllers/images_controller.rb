class ImagesController < ApplicationController
  # index corresponds to a user's collection
  def index
    @images = Image.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user
    if @image.save
      flash[:notice] << "Added image \"#{@image.title}\" to your collection!"
      redirect_to @image
    else
      flash[:alert] = "Couldn't save image \"#{@image.title}\". Please try again."
    end
  end

  # show corresponds to a single image view
  def show
    @image = Image.find(params[:id])
    @tags = @image.tags.split(',')
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private

  def image_params
    params.require(:image).permit(:title, :pictype, :uri, :latitude, :longitude, :width, :height, :tags)
  end
end
