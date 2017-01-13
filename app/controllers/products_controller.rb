class ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :set_product, only: [:show, :edit, :update, :destroy]
respond_to :html, :json
  # GET /products
  # GET /products.json
  def index
    # @products = Product.all

     @products = Product.includes(:galleries).all
   # @categories = set_category;

  end

  # GET /products/1
  # GET /products/1.json
  def show
    # @product.galleries
   # @product = Product.includes(:galleries).find(params[:id]);
   # @galleries = @product.galleries.all
   #@categories = set_category;
   puts"*********************************"
  end

  # GET /products/new
  def new
    @product = Product.new  
    @product.galleries.build
    @categories = Category.all
    respond_modal_with @product
    # @galleries = @product.galleries.build
  end

  # GET /products/1/edit
  def edit
    @product.galleries
    # @product = Product.find(params[:id]);
    # @galleries = @product.galleries.all
       # @product = Product.includes(:galleries).find(params[:id]);

    @categories = Category.select("id,name").where(:id => params[:id]);

  end

  # POST /products
  # POST /products.json
  def create

     @product = Product.new(product_params)
     @product.save
     respond_modal_with @product, location: @product
 
    # respond_to do |format|
    #   if @product.save

    #     format.html { redirect_to @product, notice: 'Product was successfully created.' }
    #     format.json { render :show, status: :created, location: @product }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :photo, :quantity, :price, :description, :category_id, :name, galleries_attributes: [:id, :photo, :image_check, :_destroy])
    end
     def category_params
      params.require(:product).permit(:name, :photo, :quantity, :price, :description)
    end
    def set_category
     @categories= Category.select("id, name").where(:id => params[:id]);
    end
end
# , galleries_attributes: [:id, :product_id, :photo, :photo_cache]


