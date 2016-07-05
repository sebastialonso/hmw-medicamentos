class MedsController < ApplicationController
  def index
    @med = Med.new
    @meds = Med.all
  end

  def new
    @med = Med.new
  end

  def create
    @med = Med.new meds_params
    @med.name = @med.name.underscore
    if @med.save
      flash[:success] = 'Medicamento agregado'
      redirect_to action: :index
    end
  end

  def show
    if not params[:name].blank?
      @med = Med.where(name: params[:name].underscore).first
      if @med.nil?
        render "not_found.json.rabl", status: :not_found
      else
        @best_price = @med.prices.minimum(:value)
        @pharmacy = Pharmacy.find(@med.prices.where(value: @best_price).first.pharmacy_id)
        Consult.create(med_id: @med.id, user: params[:id])
        render "show.json.rabl", status: :ok
      end
    else
      redirect_to action: :index
    end
  end

  def details
    @med = Med.find(params[:id])
    @price = @med.prices.build
    @pharmacies = Pharmacy.all.collect { |p| [p.name, p.id] } 
  end

  def add_price
    Rails.logger.info params
    @price = Price.new price_params
    @price.med_id = params[:id]
    @price.save
    redirect_to action: :details, id: params[:id]
  end

  private
  def meds_params
    params.require(:med).permit(:name)
  end

  def price_params
    params.require(:price).permit(:value, :pharmacy_id)
  end
end