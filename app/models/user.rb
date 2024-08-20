class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :nickname,        presence: true
 validates :last_name,       format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/},presence: true
 validates :last_name_kana,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/},presence: true
 validates :first_name,      format: { with: /\A[ァ-ヶー]+\z/},presence: true
 validates :first_name_kana, format: { with: with: /\A[ァ-ヶー]+\z/},presence: true
 validates :birthday,        presence: true

 validates :password, format: {
    with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/,
  }
end
