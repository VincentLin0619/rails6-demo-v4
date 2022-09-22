class Dashboard::Admin::UsersController < Dashboard::DashboardController
  before_action :find_user, only: %i[show edit destroy update]
  before_action :user_params, only: [:update]

  def index
    @users =
      @paginate =
        User
          .where(role: "user")
          .paginate(page: params[:page], per_page: 10)
          .order("id DESC")
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to dashboard_admin_users_path,
                  notice: "使用者#{@user.nick_name}更新成功！！！"
    else
      render :edit, notice: "編輯失敗！！"
    end
  end

  def destroy
    @user.destroy
    redirect_to dashboard_admin_users_path, notice: "使用者已刪除"
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nick_name, :email, :role)
  end
end
