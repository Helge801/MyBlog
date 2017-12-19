class PostsController < ApplicationController
  access all: [:index, :show], user: :all, admin: :all

  def new
    @post = Blog.find(params[:blog_id]).post.new #TODO: May need refactoring
  end

  def create
    @post = Post.new(post_params)
    @post.blog_id = params[:blog_id]
    byebug
      #TODO: need to make it so that when A post is greated from a blog the blog ID is passed in.
    if @post.save
      redirect_to @post.blog # TODO: may need refactoring
    end
  end

  def index

  end

  def destroy
    @post = Post.find(params[:id])
    redirect_to @post.blog # TODO: may need refactoring
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post.blog # TODO: may need refactoring
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :blog_id)
  end


end