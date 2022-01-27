class CooksController < ApplicationController
  def new
    @cook = Cook.new
  end

  def index
    @cooks = Cook.all
  end

  def show
    @cook = Cook.find(params[:id])
  end

  def create
    @cook = Cook.new(cook_params)
    @cook.user_id = current_user.id
    @cook.save
    redirect_to cook_path(@cook)
  end

  def edit
    @cook = Cook.find(params[:id])
  end

  def update
    @cook = Cook.find(params[:id])
    @cook.update(cook_params)
    redirect_to cook_path(@cook)
  end

  def destroy
    cook = Cook.find(params[:id])
    cook.destroy
    redirect_to cook_path(@cook)
  end

  private
  def cook_params
    params.require(:cook).permit(:title, :body, :main, :image)
  end
end