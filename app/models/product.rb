class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  validate :product_name, presence: true
  validate :explanation, presence: true
  validate :price, presence: true,
   format: { with: /\A[0-9]+\z/, message: 'は半角数字のみ入力してください'},
   nemericality: { other_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は300円~9999999円の間の値段でなければなりません'}
  validate :genre_id, nemericality: { other_than: 1, message: "can't be blank" }
  validate :condition_id, nemericality: { other_than: 1, message: "can't be blank" }
  validate :shipping_cost_id, nemericality: { other_than: 1, message: "can't be blank" }
  validate :prefecture_id, nemericality: { other_than: 1, message: "can't be blank" }
  validate :shipping_day_id, nemericality: { other_than: 1, message: "can't be blank" }

end