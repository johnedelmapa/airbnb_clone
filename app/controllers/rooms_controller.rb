class RoomsController < ApplicationController

  before_action :authenticate_user!,except: [:show]
  before_action :set_room,except: [:index,:new,:create]
  before_action :is_authorized, only: [:listing,:price,:description,:photos,:amenities,:location,:update]
  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(rooms_params)
    if @room.save
      flash[:notice] = "saved..."
      redirect_to listing_room_url(@room)
    else
      flash[:alert] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @photos = @room.photos
  end

  def index
    @rooms = current_user.rooms
  end

  def listing
  end

  def price
  end

  def description 
  end

  def photos
    @photos = @room.photos
  end

  def amenities
  end

  def location
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(rooms_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong"
    end
      redirect_back(fallback_location: request.referer)
  end

  private
    def rooms_params
      params.require(:room).permit(:home_type,:room_type,:accommodate,:bedroom,:bathroom,:price,:listing_name,:summary,:is_tv,:is_kitchen,:is_internet,:is_heating,:is_air,:address,:is_active)
    end

    def set_room
      @room = Room.find(params[:id])
    end
    def is_authorized
      if current_user.id != @room.user_id
        flash[:alert] = "You don't have permission"
        redirect_to root_path
      end
    end
end
