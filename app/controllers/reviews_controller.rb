class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: :destroy

  def new
  	@service = Service.find(params[:service_id])
    @review = @service.reviews.build
  end

  def create
  	@service = Service.find(params[:service_id])
  	@review = @service.reviews.build(review_params)
  	current_user.reviews << @review
    if @review.save
      flash[:success] = "Review created!"
      redirect_to service_path(@review.service.id)
    else
      render root_path
    end
  end

  def edit
  	@service = Service.find(params[:service_id])
  	@review = @service.reviews.find(params[:id])
  end

  def update
  	@service = Service.find(params[:service_id])
  	@review = @service.reviews.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:success] = "Review updated"
      redirect_to @review.service
    else
      render 'edit'
    end
  end

  def destroy
  	@service = Service.find(params[:service_id])
  	@service.reviews.find(params[:id]).destroy
    flash[:success] = "Review deleted"
    redirect_to request.referrer || root_url
  end

  private

    def review_params
      params.require(:review).permit(:comment, :rating)
    end

    # Before Filters

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to root_url if @review.nil?
    end
end
