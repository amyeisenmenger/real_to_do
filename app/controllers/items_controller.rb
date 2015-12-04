class ItemsController < ApplicationController

  def show
    @list = List.find(params[:id])
    @items = @list.items.all
  end

  def new
    @item = Item.new
    @list = List.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    # @item[:list_id] = @list.id

    if @item.save
      binding.pry
      redirect_to item_path(params[:list_id])
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :priority, :complete, :list_id)
    end

end
