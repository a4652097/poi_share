class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
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

  private
    def resourecs_params
      params.require(:resource).permit(:title, :content, :classification_id)
    end
end
