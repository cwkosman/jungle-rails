class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def average_rating
    if reviews.size.zero?
      'Not yet rated'
    else
      "Overall rating: #{(reviews.map { |r| r[:rating].to_f }.sum / reviews.size).round(1)}/5"
    end
  end

end
