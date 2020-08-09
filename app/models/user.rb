class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_one :buyer
  with_options presence: true do
    validates :name, :family_name, :last_name, :family_name_kana, :last_name_kana, :birth_day
  end
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  with_options format: { with: NAME_REGEX } do
    validates :family_name, :last_name
  end
  NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  with_options format: { with:  NAME_KANA_REGEX } do
    validates :family_name_kana, :last_name_kana
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
