class ReviewsController < ApplicationController
  before_filter :require_user

  def require_user
    if !current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_url # halts request cycle
    end
  end

  def create
    # product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user = current_user

    if @review.save
      redirect_to product_url(params[:product_id])
    else
      redirect_to product_url(params[:product_id])
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to :back
  end

  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
