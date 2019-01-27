class StatisticService

  # Get and initialize data recovered from search form
  def initialize(params)
    @id_user = params[:user_id]
    @year = params[:year]
  end

  # Get expenses statistics for given year and user
  def GetExpensesPerYear(user)

    # Store expenses related to the user for the given year
    list_expenses = Array.new
    # Store statistics per month
    @list_statistics = Array.new

    # Initialize month's list 
    for i in 1..12
     statistic = Statistic.new
     statistic.month = i
     @list_statistics.push statistic
    end

    if user.user_type =="admin"
      allexpenses = Expense.all
    else
      allexpenses = user.expenses
    end

    # Push related expenses into list using year and user id
    allexpenses.each do |expense|

      if (ExtractYear(expense.expense_date).to_s == @year.to_s) and (expense.user_id.to_s == @id_user.to_s)
        list_expenses.push expense
      end

    end

    # Update Statistic object with required details picked from expenses
    # for related month
    list_expenses.each do |single_expense|
      current_month = ExtractMonth(single_expense)

      if single_expense.approved == "approved" then
        @list_statistics[current_month-1].totalAmount += single_expense.amount
        @list_statistics[current_month-1].sumApproved += 1
      elsif single_expense.approved == "declined" then
        @list_statistics[current_month-1].sumDeclined += 1
      else
        @list_statistics[current_month-1].sumWaiting += 1
      end

    end

    # Change month number by month name
    @list_statistics.each do |month_static|
      SetMonthName(month_static)
    end

    # Return required list
    @list_statistics

  end

  # Get the year from the date time of an expense
  def ExtractYear(date)
     date.year
  end

  # Get the month from the date time of an expense
  def ExtractMonth(expense)
    expense.expense_date.month
  end

  # Change the numeric value with the month's name
  def SetMonthName(static)

    case static.month
      when 1
        static.month = "January"
      when 2
        static.month = "February"
      when 3
        static.month = "March"
      when 4
        static.month = "April"
      when 5
        static.month = "May"
      when 6
        static.month = "June"
      when 7
        static.month = "July"
      when 8
        static.month = "August"
      when 9
        static.month = "September"
      when 10
        static.month = "October"
      when 11
        static.month = "November"
      else
        static.month = "December"
    end


  end

end