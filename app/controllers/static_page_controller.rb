class StaticPageController < ApplicationController
  
  def home
    @rooms = Room.where(is_active: true).limit(3)
  end

  def search
    #step-1-assign session
    if params[:search].present?
      #create session
      session[:loc_search] = params[:search]
    end
    #step-2-check the session if empty or not
    if session[:loc_search] && session[:loc_search] != ""
      #Grab al places and nearby based in the session[:loc_search]
      @room_address = Room.where(is_active: true).near(session[:loc_search],5,order: 'distance')
    else
      #grab all places
      @room_address = Room.where(is_active: true).all
    end
    #step-3-use ransack gem
    @search = @room_address.ransack(params[:q])
    @rooms = @search.result
    @arrRooms = @rooms.to_a
    #step-4-check if start date and date is empty or taken
    if(params[:start_date] && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty?)
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @rooms.each do |room|
        not_available = room.reservations.where(
          "(? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)",
          start_date, end_date,
          start_date, end_date)          
        if not_available.length > 0
          @arrRooms.delete(room)
        end
      end
    end
  end
end
