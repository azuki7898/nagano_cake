class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:id])
    @item.save
    redirect_to admin_items_path
  end

  def edit
  end

  def show
    @item.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image_id,:introduction, :price, :is_active)
  end

end
