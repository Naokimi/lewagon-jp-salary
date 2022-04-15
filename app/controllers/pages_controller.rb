class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @salaries = if query_params.blank?
                  Salary.all
                else
                  filtered_salaries
                end

    @salaries = @salaries.order(year: :desc)
    math_variables
    respondent_variables
  end

  def faq; end

  private

  def filtered_salaries
    # turn query parameters into SQL string for querying
    query = query_params.to_h[:query].map { |k, v| "#{k} = #{v}" }.join(' AND ')
    Salary.where(query)
  end

  def math_variables
    return if @salaries.blank?

    amounts = @salaries.pluck(:amount).sort
    mid = (amounts.length - 1) / 2.0
    @median = (amounts[mid.floor] + amounts[mid.ceil]) / 2
    @average = amounts.sum(0) / amounts.length
  end

  def respondent_variables
    @respondents = Salary.count
    @max_respondents = ENV['LW_JAPAN_USERS'].split(',').length
    @respondent_rate = @respondents/@max_respondents
  end

  def query_params
    params.permit(query: %i[year job_title remote flex equity workweek overtime])
  end
end
