class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :show, :update, :destroy, :destroy_user]
  def index
    @projects = current_user.projects
  end

  def new
    if current_user.DA? # A modifier par greg
        @project = Project.new
    else
      flash[:success] = "Vous devez être un directeur artistique pour créer un projet"
      redirect_to root_path
    end
  end

  def create
  @project = Project.new(project_params)
  @project.user_id = current_user.id
    if @project.save
      flash[:notice] = "Votre projet à bien était créer"
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    if current_user.actor?
      flash[:notice] = "Vous devez être un directeur artistique pour éditer un projet "
      redirect_to root_path
    end
  end

  def show
    @hash = Gmaps4rails.build_markers(@project) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Votre projet a bien été modifié"
      redirect_to project_path
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path(current_user.projects)
  end

  def destroy_user(user)
    @project.users.delete(user)
    @project.save!
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :address, :category, :begin, :end)
  end
end
