class Item < ApplicationRecord

  belongs_to :user

  #各itemカラム
  with_options presence:true do
    validates :name
    validates :catch_copy
    validates :price, inclusion: {in: 300..9999999}, format: {with: /\A[0-9]+\z/}#,message:"must be used half-width number and suitable price"}
  end
  with_options presence:true, numericality: { other_than: 1 } do
    validates :day_id
    validates :shipping_id
    validates :from_id
    validates :status_id
    validates :category_id
  end

  has_one_attached :image
  validates :image,presence:true

  #アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :day
  belongs_to :shipping
  belongs_to :from
  belongs_to :status
  belongs_to :category

end
