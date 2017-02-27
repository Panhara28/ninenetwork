class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.save
  end

  private
    def plan_params
      params_require(:plan).permit(:title,:banwidth,:connection,:support,:freebie)
    end
end
