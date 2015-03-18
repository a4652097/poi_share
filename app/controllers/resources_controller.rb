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
    if @resource.save
      redirect_to resources_path
    end
  end

  def show
    @classifications = Classification.all
    @resource = Resource.find(params[:id])
    @comment_list = Comment.where("resource_id=?","#{params[:id]}")
  end

  def comment
    @comment = Comment.new(comment_params)
    if @comment.save
     redirect_to resource_path
   end
  end

  private
    def resourecs_params
      params.require(:resource).permit(:title, :content, :classification_id, :user_id)
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id, :resource_id)
    end
end
