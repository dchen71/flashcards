class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Requires login
  def require_login
  	unless signed_in?
  		flash[:error] = "Please login to view content"
  		redirect_to root_path
  	end
  end

  #Devise override to redirect after signing in
  def after_sign_in_path_for(resource)
    decks_path
  end
end
