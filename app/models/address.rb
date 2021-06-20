class Address < ApplicationRecord

  belongs_to :order

  #各addressカラム
  #住所
  with_options presence:true do
    validates :post,format:{with: /\A\d{3}[-]\d{4}\z/}
    validates :municipality
    validates :house_number
    validates :tel,format:{with: /\A[0-9]{10,11}+\z/}
  end
  #都道府県
  with_options presence:true, numericality: { other_than: 1 } do
    validates :from_id
  end

  #アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :from

end
