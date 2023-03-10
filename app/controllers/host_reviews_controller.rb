class HostReviewsController < ApplicationController
 
  def create
    @host_review = current_user.host_reviews.create(host_review_params)
    flash[:success] = "Review Created"
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @host_review = Review.find(params[:id])
    @host_review.destroy
    flash[:success] = "Removed"
    redirect_back(fallback_location: request.referer)
  end

  private
  def host_review_params
    params.require(:host_review).permit(:room_id,:reservation_id,:star,:guest_id,:comment)
  end

end