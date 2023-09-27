class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
    @user_name = current_user.user_name
    @department = @user.department
    @login_num = @user.login_num
    @email = @user.email
    @password = @user.password
  end
end
