class PostsController < ApplicationController

  before_action :authenticate_user
  def index
    posts = Post.all
    if posts.count > 0
      render json: posts, status: 200
    else
      render json: 'No post found', status:404
    end
  end

  def show
    post = Post.find(params[:id])
    if post
      render json: post, status: 200
    else
      render json: 'No post found', status: 404
    end
  end

  def create
    post = Post.new(post_params)
    if post['content'].scan(/\b[A-Z]+\b/).length > 0
      render json: {error: 'CAPITAL word should not be present'}
    else
      if post.save
        render json: post, status: 200
      else
        render json: {error: post.errors}, status:400
      end
    end
  end

  private

    def post_params
      params.permit(:content)
    end
end
