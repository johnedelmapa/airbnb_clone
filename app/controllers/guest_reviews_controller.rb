class GuestReviewsController < ApplicationController
 
  def create
    @guest_review = current_user.guest_reviews.create(guest_review_params)
    flash[:success] = "Review Created"
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @guest_review = Review.find(params[:id])
    @guest_review.destroy
    flash[:success] = "Removed"
    redirect_back(fallback_location: request.referer)
  end

  private
  def guest_review_params
    params.require(:guest_review).permit(:room_id,:reservation_id,:star,:host_id,:comment)
  end

end