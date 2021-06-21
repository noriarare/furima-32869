class OrderAddress

  include ActiveModel::Model
  attr_accessor :token, :post, :municipality, :house_number, :tel, :building, :from_id, :user_id, :item_id

  with_options presence:true do
    validates :post,format:{with: /\A\d{3}[-]\d{4}\z/}
    validates :municipality
    validates :house_number
    validates :tel,format:{with: /\A[0-9]{10,11}+\z/}
    validates :token
    validates :user_id
    validates :item_id
  end

  with_options presence:true, numericality: { other_than: 1 } do
    validates :from_id
  end


  def save
    order = Order.create(token: token,user_id: user_id, item_id: item_id)
    Address.create(post: post,municipality: municipality,house_number: house_number,tel: tel,building: building,from_id: from_id,order_id: order.id)
  end
end