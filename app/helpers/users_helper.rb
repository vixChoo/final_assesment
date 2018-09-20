module UsersHelper

    def current_user
       # Look up the current user based on user_id in the session cookie:
        if session[:user_id]
          @current_user ||= User.find_by_id(session[:user_id])
        end
    end

    def signed_in?
        !!current_user
    end
   # a convenient method to set the session to given user's id with the `:user_id` key
    def sign_in(user)
      session[:user_id] = user.id
    end

    # clears the session by setting the value of `:user_id` key to `nil`
    def log_out
      session[:user_id] = nil
    end
    # authroize method redirects user to login page if not logged in:
      def authorize
        redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
      end

  
end
