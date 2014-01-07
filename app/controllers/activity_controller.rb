class ActivityController < ApplicationController
  respond_to :json

  def index
    @activities = Activity.all
  end

  def create
    activity = Activity.new(actvities_params)
    activity.save
    respond_with(activity)
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    respond_with(activity)
  end

  def update
    activity = Activity.find(params[:id])
    activity.update_attributes(actvities_params)
    respond_with(activity)
  end

  private

  def actvities_params
    params.require(:activity).permit(:name, :learning_goal_id, :is_completed)
  end
end
