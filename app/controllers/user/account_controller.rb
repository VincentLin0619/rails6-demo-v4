class User::AccountController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # 掛上seesion紀錄註冊好的使用者
      redirect_to login_path, notice: "註冊成功！"
    else
      render :new
      flash[:alert] = "有什麼出錯了"
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :password, :password_confirmation, :email)
  end
end
