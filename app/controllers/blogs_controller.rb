class BlogsController < ApplicationController
  before_action :get_blog, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show], user: :all, admin: :all

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blog.new(blog_params)
    @blog.image = "http://unsplash.it/#{[*290..310].sample}/#{[*190..210].sample}?random"
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
    @posts = @blog.post
    @comments = @blog.comment
  end

  def edit
    if !(current_user.id == @blog.user_id || current_user.has_roles?(:admin))
      flash[:notice] = "You cannot edit blogs that do not belong to you"
      redirect_to pages_my_profile_path if current_user.id != @blog.user_id
    end
  end

  def update
    if (current_user.id == @blog.user_id || current_user.has_roles?(:admin))
      if @blog.update(blog_params)
        redirect_to @blog
      else
        render :edit
      end
    else
      flash[:notice] = "You cannot edit blogs that do not belong to you"
      redirect_to pages_my_profile_path
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end


#==== Private ====================
  private
#=================================

  def blog_params
    params.require(:blog).permit(:title, :body, :image, :user_id)
  end

  def get_blog
    @blog = Blog.find(params[:id])
  end
end
