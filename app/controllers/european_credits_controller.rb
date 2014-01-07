class EuropeanCreditsController < ApplicationController
  respond_to :json

  def index
    @european_credits = EuropeanCredit.all
  end

  def create
    european_credit = EuropeanCredit.new(european_credits_params)
    european_credit.save
    respond_with(european_credit)
  end

  def show
    @european_credit = EuropeanCredit.includes(:activity).find(params[:id])
  end

  def destroy
    european_credit = EuropeanCredit.find(params[:id])
    european_credit.destroy
    respond_with(european_credit)
  end

  def update
    european_credit = EuropeanCredit.find(params[:id])
    european_credit.update_attributes(european_credits_params)
    respond_with(european_credit)
  end

  private

  def european_credits_params
    params.require(:european_credit).permit(:amount, :level, :competence_id)
  end
end
