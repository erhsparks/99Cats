class CatsController < ApplicationController

  def index
    @cats = Cat.all

    render :index
  end

  def show
    @cat = Cat.find(params[:id])

    render :show
  end

  def new
    render :new
  end

  def create
    @cat = Cat.create!(cat_params)

    redirect_to cat_url(@cat.id)
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update(cat_params)

    redirect_to cat_url(@cat.id)
  end


  private
  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end
