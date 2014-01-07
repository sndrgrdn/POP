class CompetencesController < ApplicationController
  respond_to :json

  def index
    @competences = Competence.all
  end

  def create
    competence = Competence.new(competences_params)
    competence.save
    respond_with(competence)
  end

  def show
    @competence = Competence.includes(:learning_goals, :european_credits).find(params[:id])
  end

  def destroy
    competence = Competence.find(params[:id])
    competence.destroy
    respond_with(competence)
  end

  private

  def competences_params
    params.require(:competence).permit(:name)
  end

end
