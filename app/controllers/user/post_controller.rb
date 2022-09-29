class User::PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path, notice: "文章新增成功"
    else
      render :new
    end
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
