class ResourcesController < ApplicationController
  before_action :params_id, only:[:destroy, :show, :edit, :update]
  def index
    if params[:classification].present?
      @resources = Resource.where("classification_id=?","#{params[:classification]}").page(params[:page]).per(10)
    elsif params[:keyword].present?
      @resources = Resource.where("title like ?","%#{params[:keyword]}%").page(params[:page]).per(10)
    else
      @resources = Resource.all.page(params[:page]).per(10)
    end
    @classifications = Classification.all
  end

  def new
    @resource = Resource.new
    @classifications = Classification.all
  end

  def create
    @resource = Resource.new(resourecs_params)
    if @resource.save
      redirect_to resources_path
    else
      redirect_to new_resource_path
    end
  end

  def show
    @classifications = Classification.all
    @comment_list = Comment.where("resource_id=?","#{params[:id]}").page(params[:page]).per(10)
  end

  def comment
    @comment = Comment.new(comment_params)
    if @comment.save
     redirect_to resource_path
   end
  end

  def destroy
    @resource.destroy
    redirect_to resources_path
  end

  def edit
    @classifications = Classification.all
  end

  def update
    if @resource.update(resourecs_params)
      redirect_to resource_path
    else
      redirect_to edit_resource_path
    end
  end

  private
    def resourecs_params
      params.require(:resource).permit(:title, :content, :classification_id, :user_id)
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id, :resource_id)
    end

    def params_id
      @resource = Resource.find(params[:id])
    end
end
