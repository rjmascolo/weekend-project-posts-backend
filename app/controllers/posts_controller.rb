class PostsController < ApplicationController

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def index
    posts = Post.all
    render json: posts
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: post
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.delete
  end

  private

  def post_params
    params.require(:post).permit(:content, :user)
  end

end
