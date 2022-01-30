class SalariesController < ApplicationController
  def new
    @salary = Salary.new
  end

  def create
    @salary = Salary.new(salary_params)
    if @salary.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def salary_params
    params.require(:salary).permit(:amount, :equity, :flex, :graduation, :overtime, :remote, :role_name, :workweek)
  end
end
