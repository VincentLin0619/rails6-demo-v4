class User::ResetPasswordController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      ResetPasswordMailer.with(user: @user).reset.deliver_now
      redirect_to root_path, notice: "驗證信已寄出,請查看信件！"
    else
      flash[:alert] = "信箱無效"
      render :new
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "reset_password")
    # binding.irb
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to login_path, notice: "驗證信已過期，請重新寄送！！"
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "reset_password")
    if @user.update(user_params)
      redirect_to login_path, notice: "密碼更新成功！"
    else
      render :edit, notice: "更新失敗"
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :reset_password_token)
  end
end
