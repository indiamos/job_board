class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

# You _could_ just do
#   def create
#     Job.create(params)
#     redirect_to jobs_path
#   end
# and omit the `job_params`, but the method we're using—strong params—limits possible inputs, for added security.

  def create
    Job.create(job_params)
    redirect_to jobs_path
  end

  private # Every method below this keyword is private; everything above is public; there is also `protected`.

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
