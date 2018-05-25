class Users::OmniauthCallbacksController < ApplicationController
  Devise::OmniauthCallbacksController
  # include DeviseTokenAuth::Concerns::SetUserByToken

  def facebook
  	p "QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ"
  	p "QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ"
  	p "QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ"
	@user = User.create_from_provider_data(request.env['omniauth.auth'])
    binding.pry
    if @user.persisted?
      sign_in_and_redirect @user
      if is_navigational_format?
        flash[:success] = "Welcome to the Rails app you are authenticated! with facebook"
      end 
    else
	  flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
	  redirect_to new_user_registration_url
	end 
  end

  def failure
  	p "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
  	p "failure................"
  end
end
