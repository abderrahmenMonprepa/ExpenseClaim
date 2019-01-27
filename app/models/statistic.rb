class Statistic

  attr_accessor :totalAmount, :sumApproved, :sumDeclined, :sumWaiting, :month

  def initialize
    @totalAmount = @sumApproved = @sumDeclined = @sumWaiting = 0
    @month = 1
  end

end