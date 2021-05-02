class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #フルネーム、漢字、平仮名、カタカナ
  with_options presence:true,format:{with: /\A[ぁ-んァ-ン一-龥]/,message:"is not used kanji,hiragana,katakana"} do
    validates :last_name
    validates :first_name
  end
  #フルネーム、カタカナ
  with_options presence:true,format:{with: /\A[ァ-ヶー－]+\z/,message:"is not used katakana"} do
    validates :last_name_kana
    validates :first_name_kana
  end
  #ニックネーム
  validates :nickname, presence: true
  #誕生日
  validates :birthday, presence: true
  #パスワード設定
  validates :password, presence: true,format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,message: "Include both letters and numbers"}

  has_many :items

end
