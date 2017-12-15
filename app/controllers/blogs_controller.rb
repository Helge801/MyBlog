class BlogsController < ApplicationController
  before_action :get_blog, only: [:show, :edit, :update, :destroy]
  # access all: [:home, :help, :legal, :about, :donate], user: :profile, admin: :all

  def new

  end

  def create
    @blog + Blog.new(blog_params)
    if @blog.save
      redirect_to @blog
    else
      render new
    end
  end

  def index
    @blogs = Blog.all
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end


#==== Private ====================
  private

  def blog_params
    params.require(:blog).permit(:title, :body, :image, :user_id)
  end

  def get_blog
    @blog = Blog.find(params[:id])
  end
end
