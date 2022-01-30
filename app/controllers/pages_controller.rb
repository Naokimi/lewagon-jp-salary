class PagesController < ApplicationController
  def home
    @salaries = if params[:query].blank?
                  Salary.all
                else
                  filtered_salaries
                end
  end

  private

  def filtered_salaries
    Salary.all
  end
end
