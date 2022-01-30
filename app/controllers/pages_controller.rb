class PagesController < ApplicationController
  def home
    @salaries = if params[:query].blank?
                  Salary.all
                else
                  filtered_salaries
                end

    @salaries.order(:graduation)
    math_variables
  end

  private

  def filtered_salaries
    Salary.all
  end

  def math_variables
    amounts = @salaries.pluck(:amount).sort
    mid = (amounts.length - 1) / 2.0
    @median = (amounts[mid.floor] + amounts[mid.ceil]) / 2
    @average = amounts.sum(0) / amounts.length
  end
end
