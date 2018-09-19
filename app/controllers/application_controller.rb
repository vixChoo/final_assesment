class ApplicationController < ActionController::Base
     add_flash_types :danger, :info , :warning , :success

     
# Make the current_user method available to views also, not just controllers:
  helper_method :current_user 

  def current_user
     # Look up the current user based on user_id in the session cookie:
      if session[:user_id]
        @current_user ||= User.find_by_id(session[:user_id])
      end
  end

  # authroize method redirects user to login page if not logged in:
    def authorize
      redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
    end
  

end
