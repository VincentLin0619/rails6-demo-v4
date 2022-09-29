class ProductController < ApplicationController
  def index
    @products = @paginate = Product.all.paginate(page: params[:page], per_page: 8)
  end

  def show
    @product = Product.find(params[:id])
  end
end
