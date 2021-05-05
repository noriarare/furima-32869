class Item < ApplicationRecord

  belongs_to :user

  #各itemカラム
  validates :name, presence: true
  validates :catch_copy, presence: true
  validates :price, presence: true, inclusion: {in: 300..9999999}, format: {with: /\A[0-9]+\z/}#,message:"must be used half-width number and suitable price"}
  validates :day_id,presence:true, numericality: { other_than: 1 }
  validates :shipping_id,presence:true, numericality: { other_than: 1 }
  validates :from_id,presence:true, numericality: { other_than: 1 }
  validates :status_id,presence:true, numericality: { other_than: 1 }
  validates :category_id,presence:true, numericality: { other_than: 1 }

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
