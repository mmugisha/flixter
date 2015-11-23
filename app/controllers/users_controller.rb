class UsersController < Clearance::UsersController
	def create

	    @user = user_from_params

	    if @user.save
	      sign_in @user
	      flash[:success] = "Welcome! You have succesfully signed in"
	      redirect_back_or url_after_create
	    else
	      render template: "users/new"
	    end
  end

  private

  #Mugisha: override user_params to extract only email and password from params hash
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation) || Hash.new
  end




end