class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :name, presence: true
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates :family_name, presence: true, format: { with: NAME_REGEX }
  validates :last_name, presence: true, format: { with: NAME_REGEX }
  NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  validates :family_name_kana, presence: true, format: { with: NAME_KANA_REGEX }
  validates :last_name_kana, presence: true, format: { with: NAME_KANA_REGEX }
  validates :birth_day, presence: true
end
