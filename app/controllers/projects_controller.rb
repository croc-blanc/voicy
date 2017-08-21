class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :show, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :category, :begin, :end)
    # petit probleme, le save se passe bien mais la category n'est pas enregister
    # car elle n'est meme pas envoyer dans les params lors du create
  end
end
