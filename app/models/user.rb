class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'must include both letters and numbers' }
  validates :password, format: { without: /\p{Han}|\p{Hiragana}|\p{Katakana}/, message: 'cannot contain full-width characters' }
  validates :sei, presence: true, format: { with: /\A[^\x20-\x7E]+\z/, message: "can't contain half-width characters" }
  validates :mei, presence: true, format: { with: /\A[^\x20-\x7E]+\z/, message: "can't contain half-width characters" }
  validates :kana_sei, presence: true, format: { with: /\A[\p{katakana}\u30A0-\u30FF]+\z/, message: "must be in katakana" }
  validates :kana_mei, presence: true, format: { with: /\A[\p{katakana}\u30A0-\u30FF]+\z/, message: "must be in katakana" }
  validates :birthday, presence: true
  
end

