class Address < ApplicationRecord

  belongs_to :order

  #アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :from

end
