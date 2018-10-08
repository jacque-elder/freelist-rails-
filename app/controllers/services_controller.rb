class ServicesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def index
    @services = Service.paginate(page: params[:page])
  end

  def show
  	@service = Service.find(params[:id])
  end

  def new
  	@service = current_user.services.build if logged_in?
  end

  def create
    @service = current_user.services.build(service_params)
    if @service.save
      flash[:success] = "Service created!"
      redirect_to root_url
    else
      render services_path
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(service_params)
      flash[:success] = "Service updated"
      redirect_to @service
    else
      render 'edit'
    end
  end

  def destroy
  	Service.find(params[:id]).destroy
    flash[:success] = "Service deleted"
    redirect_to user_path(@service.user)
  end

	private

    def service_params
      params.require(:service).permit(:name, :price, :image, 
      	                              :description, :email, 
      	                              :website, :phone)
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
      @service = current_user.services.find_by(id: params[:id])
      redirect_to root_url if @service.nil?
    end
end
