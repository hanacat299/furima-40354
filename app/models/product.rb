class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true,
   format: { with: /\A[0-9]+\z/, message: 'は半角数字のみ入力してください'},
   numericality: { other_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は300円~9999999円の間の値段でなければなりません'}
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }

end