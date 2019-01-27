class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy, :approve]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = current_user.expenses.decorate
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  def user_expenses
    @expenses = Expense.all.decorate
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)
    user = User.find(@expense.user_id)
    @expense.claimer_name = user.first_name + ' ' + user.last_name
      if @expense.save
        flash[:success]= 'Expense was successfully created.' 
        redirect_to expenses_path
      else
        render :new
      end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @expense.update_column(:approved ,  "approved")
    respond_to do |format|
        format.js { flash.now[:success] = "Expense was approved"  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id]).decorate
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:claimer_name, :expense_date, :description, :amount, :approved, :image, :user_id)
    end
end
