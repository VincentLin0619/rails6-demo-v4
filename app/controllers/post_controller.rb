class PostController < ApplicationController
  def index
    @posts = @paginate = Post.all.paginate(page: params[:page], per_page: 8)
  end
end
