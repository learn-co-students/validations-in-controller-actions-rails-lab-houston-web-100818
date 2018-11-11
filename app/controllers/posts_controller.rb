class PostsController < ApplicationController
  before_action :set_post

  def set_post
    if params[:id]

      @post = Post.find(params[:id])
    else 
      @post = Post.new
    end
  end


  def create
    @post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else 
      redirect_to new_post_path
    end 
  end 

  def update
    @post.assign_attributes(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else 
      render :edit
    end 
  end
   
 
  private

  def post_params
    params.permit(:category, :content, :title)
  end
end
