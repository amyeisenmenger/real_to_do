class ItemsController < ApplicationController

  def show
    @list = List.find(params[:id])
    @items = @list.items.all
  end

  def new
    @item = Item.new(item_params)
    @list = List.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def item_params
    end

end
