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
        
end

