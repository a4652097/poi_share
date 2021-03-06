class ResourcesController < ApplicationController
  before_action :get_resource_id, only:[:destroy, :show, :edit, :update]
  def index
    if params[:classification].present?
      @resources = Resource.where("classification_id=?","#{params[:classification]}").order(updated_at: :desc).page(params[:page]).per(10)
    elsif params[:keyword].present?
      @resources = Resource.where("title like ?","%#{params[:keyword]}%").order(updated_at: :desc).page(params[:page]).per(10)
    elsif params[:tag].present?
      @resources = Resource.essence.order(updated_at: :desc).page(params[:page]).per(10)
    else
      @resources = Resource.order(updated_at: :desc).page(params[:page]).per(10)
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
      render 'new'
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
      render 'edit'
    end
  end

  private
    def resourecs_params
      params.require(:resource).permit(:title, :content, :classification_id, :user_id)
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id, :resource_id)
    end

    def get_resource_id
      @resource = Resource.find(params[:id])
    end
end
