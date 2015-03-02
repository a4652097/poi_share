class ResourcesController < ApplicationController
  def index
  end

  def new
    @post = Post.new
    @classification = Classification.all
  end

  def create
    
  end
end
