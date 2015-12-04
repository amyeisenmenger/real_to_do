class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      #TODO: show confirmation message? or ask if want to add items now?
      redirect_to lists_path
    else
      # TODO: show error message
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      # TODO: error message
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to lists_path
    else
      redirect_to list_path(@list)
    end
  end

  private

    def list_params
      params.require(:list).permit(:name)
    end

end
