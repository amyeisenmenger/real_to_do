class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @list = List.find(@item[:list_id])
  end

  def new
    @item = Item.new
    @list = List.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to list_path(@item[:list_id])
    else
      # TODO: error message
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to list_path(@item[:list_id])
    else
      redirect_to item_path(@item)
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :priority, :complete, :list_id)
    end

end
