class ProductsController < ApplicationController
  def index
  # @products is what we are naming the model list. We put Product.all because Product is the model's name in the database that we are pulling from!
  @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  def new
    
  end

  def create
    product = Product.new( 
                      name: params[:name], 
                      description: params[:description], 
                      price: params[:price] 
    )

    product.save

    redirect_to "/products"
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(
                      name: params[:name], 
                      description: params[:description], 
                      price: params[:price])

    redirect_to "/products"
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy

    redirect_to "/products"
  end
end
