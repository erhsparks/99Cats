class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all

    render :new
  end

  def create
    @rental_request = CatRentalRequest.create!(rental_params)

    redirect_to cat_rental_request_url(@rental_request.id)
  end

  def show
    @rental_request = CatRentalRequest.find(params[:id])

    render :show
  end

  private
  def rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end

end
