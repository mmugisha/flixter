class UsersController < Clearance::UsersController
	def create
	    @user = user_from_params

	    if @user.save
	      sign_in @user
	      flash[:success] = "Welcome! You have succesfully signed in"
	      redirect_back_or url_after_create
	    else
	      flash[:error] = "Please fix your errors"
	      render template: "users/new"
	    end
  end

end