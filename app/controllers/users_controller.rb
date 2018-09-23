class UsersController < ApplicationController
   before_action :authorize, only: [:show,:edit]
  
  def new
    @user = User.new
  end

  def show
    # authorize
  end

  def edit
    find_user
    respond_to do |format|    
       if @listing.update(user_params)
        format.html {render :show,info: 'Profile has been updated' }
        format.js
      else
        format.html { render :edit,danger: 'Profile update failed' }
        format.js
      end
    end
  end
     

  def create
    @user = User.new(user_params)
    
    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!
    
    if @user.save
      # If user saves in the db successfully:
      flash[:success] = "Account created successfully!"
      session[:user_id] = @user.id  
      redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
       flash[:danger] = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end

  end

  def destroy
    current_user.destroy
    flash[:warning] = "User deleted"
    redirect_to root_path
  end

private

  def find_user
    @user = User.find(params[:id])
  end


  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:avatar)
  end
  
end
