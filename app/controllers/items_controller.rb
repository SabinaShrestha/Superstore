class ItemsController < ApplicationController

  before_action :set_department
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @item = @department.items
  end

  def new
    @item = @department.items.new
  end

  def edit
  end

  def show
  end

  def create
    @item = @department.items.new(items_params)
    if @item.save
      redirect_to @department
    else
      render :new
    end
  end

  def update
    if @item.update(items_params)
      redirect_to [@department, @item]
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to department_path(@department)
  end

  private
    def items_params
      params.require(:item).permit(:name, :body)
    end

    def set_department
      @department = Department.find(params[:department_id])
    end

    def set_item
      @item = Item.find(params[:id])
    end
end
