class BrandsController < ApplicationController
  # GET /brands or /brands.json
  def index
    @brands = Brand.all.order(name: :asc)
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
    brand
  end

  # POST /brands or /brands.json
  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      redirect_to brands_url, notice: 'Brand was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /brands/1 or /brands/1.json
  def update
    if brand.update(brand_params)
      redirect_to brands_url, notice: 'Brand was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /brands/1 or /brands/1.json
  def destroy
    brand.destroy

    respond_to do |format|
      format.html { redirect_to brands_url, notice: "Brand was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def brand
    @brand = Brand.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def brand_params
    params.require(:brand).permit(:name)
  end
end
