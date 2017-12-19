class PostsController < ApplicationController
  access all: [:index, :show], user: :all, admin: :all

  def new
    @blog = Blog.find(params[:blog_id])
    if should_permit? @blog
      @post = @blog.post.new #TODO: May need refactoring
    else
      flash[:notice] = "You cannot create a post for a blog that doesn't belong to you"
      redirect_to @blog
    end
  end

  def create
    @post = Post.new(post_params)
    @post.blog_id = params[:blog_id]
    if should_permit? @post
      if @post.save
        flash[:notice] = "post successfully created"
        redirect_to @post.blog # TODO: may need refactoring
      end
    else
      flash[:notice] = "You cannot create a post for a blog that doesn't belong to you"
      redirect_to @post.blog
    end
  end

  def index

  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if should_permit? @post
      @blog = @post.blog
      @post.destroy
      flash[:notice] = "post successfully created"
      redirect_to @blog
    else
      flash[:notice] = "You cannot delete a post for a blog that doesn't belong to you"
      redirect_to @post.blog
    end
  end

  def update
    @post = Post.find(params[:id])
    if should_permit? @post
      if @post.update(post_params)
        flash[:notice] = "post updated successfully"
        redirect_to @post.blog
      else
        render :edit
      end
    else
      flash[:notice] = "You cannot edit a post for a blog that doesn't belong to you"
      redirect_to @post.blog
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :blog_id)
  end


end