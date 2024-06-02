class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'を入力してください'} 
  validates :nickname, presence: true
  validates :sei, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を入力してください' }
  validates :mei, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を入力してください' }
  validates :kana_sei, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を入力してください' }
  validates :kana_mei, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を入力してください' }
  validates :birthday, presence: true
end
