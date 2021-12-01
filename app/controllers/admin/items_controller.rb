class Admin::ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.save
    redirect_to admin_items_path
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
