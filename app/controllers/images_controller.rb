class ImagesController < ApplicationController
  # Must be logged in to create, edit or delete.
  before_action :authenticate_user!, except: [:index, :show]

  # index corresponds to a user's collection.
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
      flash[:notice] = "Added image \"#{@image.title}\" to your collection!"
      redirect_to @image
    else
      flash[:alert] = "Couldn't save image \"#{@image.title}\". Please try again."
      render :new
    end
  end

  # show corresponds to a single image view.
  def show
    @image = Image.find(params[:id])
    @tags = @image.tags.split(',')
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.assign_attributes(image_params)
    if @image.save
      flash[:notice] = "Image \"#{@image.title}\" updated successfully!"
      redirect_to @image
    else
      flash[:alert] = "Couldn't update image \"#{@image.title}\". Please try again."
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      flash[:notice] = "Image \"#{@image.title}\" deleted."
      redirect_to current_user
    else
      flash[:alert] = "Couldn't delete image \"#{@image.title}\". Please try again."
      render :show
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :pictype, :uri, :latitude, :longitude, :width, :height, :tags)
  end
end
