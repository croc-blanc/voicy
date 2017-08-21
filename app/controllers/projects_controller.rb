class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :show, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
    if current_user.role == "artistic_director" # A modifier par greg
        @project = Project.new
    else
      flash[:notice] = "Your should be Artistic director to create a project "
      redirect_to root_path
    end
  end

  def create
  @project = Project.new(project_params)
  @project.user_id = current_user.id
    if @project.save
      flash[:notice] = "Your project has been created"
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    if current_user.role != "artistic_director" # A modifier par greg
      flash[:notice] = "Your should be Artistic director to edit a project "
      redirect_to root_path
    end
  end

  def show
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Your project has been updated"
      redirect_to project_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :category, :begin, :end)
  end
end
