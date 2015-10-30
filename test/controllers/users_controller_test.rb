require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "sign-up successful" do
  	post :create, user:{ :email =>"mugisha@gmail.com", :password =>"ratAndDog",
  			:password_confirmation => "ratAndDog" }
  	expected_flash_message = "Welcome! You have succesfully signed in"
  	assert_equal expected_flash_message, flash[:success]
  end


  
  test "sign-up with mismatch passwords" do
  	post :create, user:{ :email =>"mugisha@gmail.com", :password =>"rat2",
  			:password_confirmation => "rat21" }
  	expected_flash_error = "Passwords don't match"
  	assert_equal expected_flash_error, flash[:error]
  end


end