class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user)
    #@item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name,:catch_copy,:price,:day_id,:shipping_id,:from_id,:status_id,:category_id,:image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end

end
