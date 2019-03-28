class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:category_id] && Category.ids.include?(params[:category_id].to_i)
      @category = Category.find(params[:category_id])
      @products = @category.products
    else
      @products = Product.all
    end
    @categories = Category.all
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def new
    @categories = Category.all
  end

  def create
    product = Product.new( 
                      name: params[:name], 
                      description: params[:description], 
                      price: params[:price],
                      image_url: params[:image_url],
                      category_id: params[:category_id] 
    )

    product.save
    flash[:success] = "You created a new product"
    redirect_to "/products"
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    product = Product.find(params[:id])
    product.update(
                      name: params[:name], 
                      description: params[:description], 
                      price: params[:price],
                      image_url: params[:image_url],
                      category_id: params[:category_id]


                  )
    flash[:success] = "Product is updated"
    redirect_to "/products"
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:success] = "Product deleted"
    redirect_to "/products"
  end
end
