class StaticPageController < ApplicationController
  
  def home
    @rooms = Room.where(is_active: true).limit(3)
  end


end
