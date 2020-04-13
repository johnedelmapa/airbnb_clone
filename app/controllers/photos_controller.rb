class PhotosController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    if params[:images]
      params[:images].each do |img|
        @room.photos.create(image: img)
      end
      flash[:notice] ="Saved..."
      redirect_back(fallback_location: request.referer)
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:success] = "Successfully Deleted!"
    redirect_back(fallback_location: request.referer)
  end
end
