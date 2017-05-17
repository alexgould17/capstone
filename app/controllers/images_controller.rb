class ImagesController < ApplicationController
  # index corresponds to a user's collection
  def index
    @images = Image.all # where(user_id: params[:user_id])
  end

  def new
    @image = Image.new
  end

  def create

  end

  # show corresponds to a single image view
  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update

  end

  def destroy

  end
end