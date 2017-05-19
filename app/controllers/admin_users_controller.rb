class AdminUsersController < ApplicationController
  layout "admin"
  
  before_action :confirm_logged_in

  def index
    @admin_users = User.sorted
  end

  def new
    @admin_user = User.new
  end

  def edit
    @admin_user = User.find(params[:id])
  end
  
  def create
    @admin_user = User.new(admin_user_params)
    if @admin_user.save
      flash[:notice] = "Admin user created"
      redirect_to(action: 'index')
    else
      render('new')
    end
  end
  

  def delete
    @admin_user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "Admin User destroyed"
    redirect_to(action: 'index')
  end

  private
    def admin_user_params
      params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password)
    end
end
