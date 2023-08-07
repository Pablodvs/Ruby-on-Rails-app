class ProductsController < ApplicationController
  def index
    @brands = Brand.all.order(name: :asc).load_async
    @products = Product.all.with_attached_photo.order(created_at: :desc).load_async
    if params[:brand_id]
      @products = @products.where(brand_id: params[:brand_id])
    end
    if params[:min_price].present?
      @products = @products.where('price>=?', params[:min_price])
    end
    if params[:max_price].present?
      @products = @products.where('price<=?', params[:max_price])
    end
  end 

  def show
    product
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Your product has been saved succesfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    product
  end

  def update
    if product.update(product_params)
      redirect_to products_path, notice: 'Yout product has been updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if product.destroy
      redirect_to products_path, notice: 'Product deleted', status: :see_other
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :photo, :brand_id)
  end

  def product
    @product = Product.find(params[:id])
  end
end
