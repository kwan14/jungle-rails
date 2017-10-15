class ReviewsController < ApplicationController
  before_filter :require_login
  
  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    @current_user = User.find(session['user_id'])
    @review.user_id = @current_user.id
    if @review.save
      redirect_to @product, notice: 'Review was successfully created.'
    else
      render template: 'products/show'
    end
  end

  def destroy
    #raise "You're here!!" + params[:id].to_s
    @review = Review.find params[:id]
    @review.destroy
    @product = Product.find params[:product_id]
    redirect_to @product, notice: 'Review deleted!'
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end
  def require_login
    if session['user_id'] == nil
      redirect_to '/login'
    end
  end
end
