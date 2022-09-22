class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?, :is_admin?, :authenticate_admin

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  protected

  def is_admin?
    is_login?
    current_user.role == "1"
  end

  def is_login?
    !!current_user
  end

  def authenticate_admin
    unless is_admin?
      flash[:alert] = "你不是管理員，不允許此操作"
      redirect_to root_path
    end
  end
end
