class StatisticsController < ApplicationController

  def new
    render "statics/show_statics"
  end

  def ShowExpenses
  	# Display statistics list by params
  	# user_id and year
    @list_statistics = StatisticService.new(params).GetExpensesPerYear(current_user)
    render "statics/show_statics", :collection => @list_statistics, :as => :list_statistic
  end

end