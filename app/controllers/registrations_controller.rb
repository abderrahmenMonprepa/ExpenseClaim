class RegistrationsController < Devise::RegistrationsController

 
  def create
    @user = User.new(user_params)
    @user.user_type = "user"
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'You will receive a confirmation email' }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name , :date_of_birth  , :address  , :email, :password , :password_confirmation )
    end
  
  protected

end