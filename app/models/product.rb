class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image, presence: true
  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "must be between 300 and 9999999" }
  validates :genre_id, numericality: { other_than: 1, message: "must be other than 1" }
  validates :condition_id, numericality: { other_than: 1, message: "must be other than 1" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "must be other than 1" }
  validates :prefecture_id, numericality: { other_than: 1, message: "must be other than 1" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "must be other than 1" }

end