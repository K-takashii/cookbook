class CooksController < ApplicationController
  before_action :authenticate_user!, except: [:index]

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
    if @cook.save
      redirect_to cook_path(@cook)
    else
      render :new
    end
  end

  def edit
    @cook = Cook.find(params[:id])
    if @cook.user != current_user
      redirect_to cooks_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @cook = Cook.find(params[:id])
    if @cook.update(cook_params)
      redirect_to cook_path(@cook)
    else
      render :edit
    end
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
