class PharmaciesController < ApplicationController
  def index
    @pharmacies = Pharmacy.all
    @new = Pharmacy.new
  end

  def create
    @pharmacy = Pharmacy.new pharmacy_params
    @pharmacy.save
    redirect_to action: :index
  end

  def show
    @pharmacy = Pharmacy.find(params[:id])
  end

  def edit
    @pharmacy = Pharmacy.find(params[:id])
  end

  def update
    @pharmacy = Pharmacy.find(params[:id])
    @pharmacy.update_attributes pharmacy_params
    redirect_to action: :index
  end

  def destroy
    @pharmacy = Pharmacy.find(params[:id])
    @pharmacy.destroy
    redirect_to action: :index
  end

  private
  def pharmacy_params
    params.require(:pharmacy).permit(:name)
  end
end