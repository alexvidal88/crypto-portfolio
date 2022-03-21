class CurrenciesController < ApplicationController
  def index
  end

  def search
    @currecnies = Currency.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
    render json: { currencies: @currencies }
  end

  # takes in the currency id and the amount owned
  # Returns final calculations
  def calculate
    amount = params[:amount]
    render json: {
      currency: currency,
      current_price: currency.current_price,
      amount: amount,
      value: currency.calculatr_value(amount)
    }
  end

  private

  def currency
    @currency ||= Currency.find(params[:id])
  end

end
