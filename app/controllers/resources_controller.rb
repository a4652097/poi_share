class ResourcesController < ApplicationController
  def index
    if params[:classification].present?
      @resources = Resource.where("classification_id=?","#{params[:classification]}")
    else
      @resources = Resource.all
    end
    @classifications = Classification.all
  end

  def new
    @resource = Resource.new
    @classification = Classification.all
  end

  def create
    @resource = Resource.new(resourecs_params)
    @resource.save
    redirect_to resources_path
  end

  def show
    @classifications = Classification.all
    @resource = Resource.find(params[:id])
  end

  private
    def resourecs_params
      params.require(:resource).permit(:title, :content, :classification_id, :user_id)
    end
end
