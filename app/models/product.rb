class Product < ApplicationRecord
has_many :user_products
has_many :users, through: :user_products
has_one_attached :image
validates :name, length: { maximum: 20}, presence: true
belongs_to :category
validates :description, length: { maximum: 500}, presence: true
validates :price, numericality: {greater_than: 0}
validates :image, presence: true
  def price_format
    "$%.2f" % (price / 100.00)
  end
end
