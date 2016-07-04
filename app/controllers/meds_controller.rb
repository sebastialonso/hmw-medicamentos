class MedsController < ApplicationController
  def show
    Rails.logger.info params
    @med = Med.where(name: params[:name]).first
    if @med.nil?
      render "notfound.html.erb", status: :ok
    else
      @best_price = @med.prices.minimum(:value)
      @pharmacy = Pharmacy.find(@med.prices.where(value: @best_price).first.pharmacy_id)
      render "show.html.erb", status: :ok
    end
  end
end