class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_job, only: %i[show edit update destroy]

  def index
    @jobs = Job.all.order('created_at DESC')
  end

  def show; end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def edit; end

  def update
    if @job.update(job_params)
      flash[:success] = 'Job updated'
      redirect_to @job
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:name,
                                :description,
                                :emp_name,
                                :emp_email,
                                :category,
                                :expire_period)
  end

  def find_job
    @job = Job.find(params[:id])
  end
end
