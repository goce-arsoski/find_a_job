class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_application, only: %i[show edit update destroy]

  def show; end

  def new
    @job = Job.find(params[:job_id])
    @application = @job.applications.build
  end

  def create
    @job = Job.find(params[:job_id])
    @application = @job.applications.build(application_params)

    if @application.save
      NotifierMailer.welcome(current_user, @job.user).deliver_now
      redirect_to @job
    else
      render :new
    end
  end

  def edit
    @job = @application.job
  end

  def update
    @job = @application.job

    if @application.update(application_params)
      flash[:success] = 'Application updated'
      redirect_to @job
    else
      render :edit
    end
  end

  def destroy
    @job = @application.job

    @application.destroy
    redirect_to root_path
  end

  private

  def application_params
    params.require(:application).permit(:full_name,
                                        :birth,
                                        :email,
                                        :phone,
                                        :address,
                                        :education)
  end

  def find_application
    @application = Application.find(params[:id])
  end
end
