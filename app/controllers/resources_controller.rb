class ResourcesController < ApplicationController
  def index
    @resourecs = Resource.all
  end

  def new
    @resourec = Resource.new
    @classification = Classification.all
  end

  def create
    @resourec = Resource.new(resourecs_params)
    @resourec.save
    redirect_to resources_path
  end

  private
    def resourecs_params
      params.require(:resource).permit(:title, :content, :classification)
    end
end
