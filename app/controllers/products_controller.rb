class ProductsController < ApplicationController
  def index
  # @products is what we are naming the model list. We put Product.all because Product is the model's name in the database that we are pulling from!
  @products = Product.all
  end
end
