class UsersController < Clearance::UsersController
	def create
		#run this by Matt.
		#added the lines below to check that passwords match before proceeding

		password = params[:user][:password]
		password_confirmation = params[:user][:password_confirmation]

		if !(password.eql?(password_confirmation))
			flash[:error] = "Passwords don't match"
			redirect_to sign_up_path
			return			
		end

		#end of addition by Mugisha

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


  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)

	Clearance.configuration.user_model.new(user_params).tap do |user|
	  user.email = email
	  user.password = password
	end

  end

  def user_params
    params.require(:user).permit(:email, :password) || Hash.new
  end




end