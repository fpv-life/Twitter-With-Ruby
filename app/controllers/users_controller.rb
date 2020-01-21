class UsersController < ApplicationController
  def show
    if params[:id] != "sign_in"
      @user = User.find(params[:id])
      @feeds = @user.feeds      
    else
      redirect_to root_path
    end
  end

end
