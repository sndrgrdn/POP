class LearningGoalsController < ApplicationController
  respond_to :json

  def index
    @learning_goals = LearningGoal.all
  end

  def create
    learning_goal = LearningGoal.new(learning_goals_params)
    learning_goal.save
    respond_with(learning_goal)
  end

  def show
    @learning_goal = LearningGoal.includes(:activity).find(params[:id])
  end

  def destroy
    learning_goal = LearningGoal.find(params[:id])
    learning_goal.destroy
    respond_with(learning_goal)
  end

  def update
    learning_goal = LearningGoal.find(params[:id])
    learning_goal.update_attributes(learning_goals_params)
    respond_with(learning_goal)
  end

  private

  def learning_goals_params
    params.require(:learning_goal).permit(:name, :competence_id, :is_completed)
  end
end
