class ApplicationController < ActionController::Base
  include UsersHelper
  # Make the current_user method available to views also, not just controllers:
  # helper_method :current_user 
  add_flash_types :danger, :info , :warning , :success
end
  



