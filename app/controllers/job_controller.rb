class JobController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
     if params[:searchword] 
      @jobs = Job.search(params[:searchword].downcase)

      respond_to do |format|    
        format.html {render :show }
        format.js
      end
    end
  end
        
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    
    if @job.save
      # If job saves in the db successfully:
      flash[:success] = "Job created successfully!"
    else
      # If job fails model validation - probably a bad 
       flash[:danger] = "Oops!"
    end

  end

private

  def job_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:job).permit(:name, :description, :location, :price,:user_id)
  end
end

