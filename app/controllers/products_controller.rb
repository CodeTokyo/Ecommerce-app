class ProductsController < ApplicationController
  def index
  # @products is what we are naming the model list. We put Product.all because Product is the model's name in the database that we are pulling from!
  if params[:category_id] && Category.find(params[:category_id])
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

    redirect_to "/products"
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy

    redirect_to "/products"
  end
end
