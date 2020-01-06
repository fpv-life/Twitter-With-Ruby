class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

      # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  def update
    @user = User.find(params[:id])
    @user.avatar.attach(params[:user][:avatar])
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password, :bio, :location, :born_date, :avatar)}
    end
end
