class MedsController < ApplicationController
  def show
    @med = Med.where(name: params[:name].underscore).first
    if @med.nil?
      render "notfound.html.erb", status: :not_found
    else
      @best_price = @med.prices.minimum(:value)
      @pharmacy = Pharmacy.find(@med.prices.where(value: @best_price).first.pharmacy_id)
      render "show.json.rabl", status: :ok
    end
  end
end