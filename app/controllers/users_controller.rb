class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update]
  
  def index
    @users = User.all
  end
  
  def show
    @user_name = current_user.user_name
    @department = @user.department
    @login_num = @user.login_num
    @email = @user.email
    @password = @user.password
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :department, :login_num).merge(user_id: current_user.id)
  end

  def set_item
    @user = User.find(params[:id])
  end


end
