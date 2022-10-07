class Dashboard::Admin::ProductsController < Dashboard::DashboardController
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    @products = @paginate = Product.all.paginate(page: params[:page], per_page: 8)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to dashboard_products_path, notice: "商品新增成功！！<ID:#{@product.id}>"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to dashboard_products_path, notice: "商品<ID:#{@product.id}>修改成功！！！"
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to dashboard_products_path, notice: "<ID:#{@product.id}>已被刪除！！"
    else
      render :edit
    end
  end

  protected

  def product_params
    params.require(:product).permit(:remove_images, :name, :description, :price, :sku, images: [])
  end

  def find_product
    @product = Product.find_by(id: params[:id])
  end
end
