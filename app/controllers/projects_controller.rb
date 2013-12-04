class ProjectsController < ApplicationController
  #before_filter :require_login :only => [:new, :create, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
      if @product.user_id = current_user
        if @project.update_attributes(project_params)
          redirect_to project_path
        else
          render :edit
        end
      else
        render projects_path, alert: "You do not have authorization to delete this project"
      end
  end

  def destroy
    @project = Project.find(params[:id])
    
    if @product.user_id = current_user
      @project.destroy
      redirect_to projects_path
    else 
      render projects_path, alert: "You do not have authorization to delete this project"
      end
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :end_date, :goal)
  end
end
