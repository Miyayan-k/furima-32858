class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  KANA_REGEX = /\A[ァ-ヴ]+\z/.freeze
  validates_format_of [:first_kana, :last_kana], with: KANA_REGEX, message: 'は全角カタカナのみ使用できます'
  NAME_REGEX = /\A[ぁ-ん一-龥々]+\z/.freeze
  validates_format_of [:first_name, :last_name], with: NAME_REGEX, message: 'は全角漢字あるいは全角ひらがなのみ使用できます'

  validates :nickname,   presence: true
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :first_kana, presence: true
  validates :last_kana,  presence: true
  validates :birthday,   presence: true
end
