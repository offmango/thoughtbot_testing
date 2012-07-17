class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_email=(email_address)
  	session[:current_email] = email_address
  end

  def current_email
  	session[:current_email]
  end

  helper_method :current_email

  def current_user
    if current_email
      User.new(current_email)
    else
      Guest.new
    end
  end

	def authenticate
		if !current_user.signed_in?
			redirect_to new_session_path
		end
	end
end
