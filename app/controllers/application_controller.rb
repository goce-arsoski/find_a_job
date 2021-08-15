class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :find_application, only: %i[show edit update destroy]

  def index
    @applications = Application.all.order('created_at DESC')
  end

  def show; end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)

    if @application.save
      redirect_to @application
    else
      render :new
    end
  end

  def edit; end

  def update
    if @application.update(application_params)
      flash[:success] = 'Application updated'
      redirect_to @application
    else
      render :edit
    end
  end

  def destroy
    @application.destroy
    redirect_to applications_path
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
